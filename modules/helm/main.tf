
locals{

cluster_name = reverse(split("/", var.cluster_id))[0]

}
data "google_client_config" "default" {}

resource "kubernetes_namespace" "console_app" {
  metadata {
    name = "console-app"
  }
}

resource "helm_release" "main" {
  name = "cong"
  repository = var.helm_repository_link
  chart = var.chart
  namespace =  kubernetes_namespace.console_app.metadata[0].name #var.helm_namespace
  timeout   = 600
  replace   = true
  set = [
    {
      name  = "serviceAccount.create"
      value = var.set_value_sa_create #"false"
    },
    {
      name  = "serviceAccount.name"
      value = var.set_value_sa_name #"default"
    }
  ]
}
