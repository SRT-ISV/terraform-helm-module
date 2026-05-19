variable "gcp_project_id" {
  description = "The GCP project ID."
  type        = string

}

variable "helm_release_name" {
  description = "helm release name."
  type        = string
  
}

variable "artifact_registry_repo_name" {
  description = "OCI Image Name."
  type        = string
  default     = "oci-images"

}

variable "repository_link" {
  type        = string
  description = "Custom OCI or HTTP repository link. Leaves empty to default to Google Artifact Registry."
  default     = null
}

variable "repo_username" {
  description = "repository user name"
  type        = string
  default     = ""

}

variable "repo_password" {
  description = "repository user password"
  type        = string
  default     = ""

}

variable "gcp_region" {
  description = "The GCP region to deploy resources in."
  type        = string
  default     = "us-central1"
}

variable "gcp_zone" {
  description = "The GCP zone to deploy resources in."
  type        = string
  default     = "us-central1-a"
}

variable "cluster_id" {
  description = "ID of the cluster"
  type        = string
}

variable "helm_namespace" {
  description = "GKE name space"
  type        = string
}

variable "chart" {
  description = "Location of helm chart"
  type        = string
}

variable "set_inputs" {
  description = "List of set inputs (e.g. name1:val1,name2:value2)"
  type        = string
}
