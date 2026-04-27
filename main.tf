module "helm_release" {

source = "./modules/helm"
gcp_project_id = var.gcp_project_id
region = var.region
cluster_name = var.cluster_name
chart = var.chart
helm_repository_link = var.helm_repository_link
set_value_sa_create = var.set_value_sa_create
set_value_sa_name = var.set_value_sa_name



}