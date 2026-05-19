module "helm_release" {

source = "./modules/helm"
gcp_project_id = var.gcp_project_id
region = var.region
zone = var.zone
helm_release_name = var.helm_release_name
artifact_registry_repo_name = var.artifact_registry_repo_name
cluster_id = var.cluster_id
chart = var.chart
helm_namespace    = var.helm_namespace
set_inputs = var.set_inputs

}