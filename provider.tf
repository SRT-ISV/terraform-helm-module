
provider "kubernetes" {
#   host                   = "https://${data.google_container_cluster.primary.endpoint}"
#   token                  = data.google_client_config.default.access_token
#   cluster_ca_certificate = base64decode(data.google_container_cluster.primary.master_auth[0].cluster_ca_certificate)
}

provider "helm" {
#   kubernetes = {
#     host                   = data.google_container_cluster.primary.endpoint
#     cluster_ca_certificate = base64decode(data.google_container_cluster.primary.master_auth[0].cluster_ca_certificate)
#     token                  = data.google_client_config.default.access_token
#   }
}


provider "google" {
#  project = local.project_id#"gcp-pov"
#  region  = local.gcp_region
}