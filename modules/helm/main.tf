
locals{

cluster_name = reverse(split("/", var.cluster_id))[0]

# 1. Your input string
  raw_input = var.set_inputs #"serviceAccount.create:false,serviceAccount.name:default,configuration.provider:gcp"

  # 2. Convert to a list of objects
  helm_sets = [
    for pair in split(",", local.raw_input) : {
      # Split each pair by ":" and take the first part as name, second as value
      # trimspace ensures that " key : value " works just as well as "key:value"
      name  = trimspace(split(":", pair)[0])
      value = trimspace(split(":", pair)[1])
    }
  ]

}
data "google_client_config" "default" {}

resource "kubernetes_namespace" "console_app" {
  metadata {
    name = var.helm_namespace #"console-app"
  }
}

resource "helm_release" "main" {
  name = "cong"
  repository = var.helm_repository_link
  chart = var.chart
  namespace =  kubernetes_namespace.console_app.metadata[0].name #var.helm_namespace
  timeout   = 600
  replace   = true

  set = local.helm_sets
 
}


