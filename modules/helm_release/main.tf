
locals{

cluster_name = reverse(split("/", var.cluster_id))[0]
raw_input = var.set_inputs
# 2. Convert to a list of objects
  helm_sets = [
    for pair in split(",", local.raw_input) : {
      name  = trimspace(split(":", pair)[0])
      value = trimspace(split(":", pair)[1])
    }
  ]
}
data "google_client_config" "default" {}

resource "kubernetes_namespace_v1" "namespace" {
  metadata {
    name = var.helm_namespace
  }
}

resource "helm_release" "main" {
  name = var.helm_release_name 
  repository = var.repository_link != null && var.repository_link != "" ? var.repository_link : "oci://${var.gcp_region}-docker.pkg.dev/${var.gcp_project_id}/${var.artifact_registry_repo_name}"
  repository_username = "oauth2accesstoken"
  repository_password = data.google_client_config.default.access_token
  chart = var.chart 
  namespace =  kubernetes_namespace_v1.namespace.metadata[0].name
  timeout   = 600
  replace   = true

  set = local.helm_sets
 
}


