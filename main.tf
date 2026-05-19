module "helm_release" {

source = "./modules/helm_release"
gcp_project_id = var.gcp_project_id
gcp_region = var.gcp_region
gcp_zone = var.gcp_zone
helm_release_name = var.helm_release_name
repository_link = var.repository_link
artifact_registry_repo_name = var.artifact_registry_repo_name
cluster_id = var.cluster_id
chart = var.chart
helm_namespace    = var.helm_namespace
set_inputs = var.set_inputs

}