module "helm_release" {

source = "./modules/helm"
gcp_project_id = var.gcp_project_id
region = var.region
cluster_id = var.cluster_id
chart = var.chart
helm_repository_link = var.helm_repository_link
helm_namespace    = var.helm_namespace
set_inputs = var.set_inputs

}