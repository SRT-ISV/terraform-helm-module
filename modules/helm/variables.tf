variable "gcp_project_id" {
  description = "The GCP project ID."
  type        = string
  default     = ""

}

variable "region" {
  description = "The GCP region to deploy resources in."
  type        = string
  default     = "us-central1"
}

variable "cluster_name" {
  description = "Name of the cluster"
  type        = string
  default     = ""
}

variable "chart" {
  description = "Location of helm chart"
  type        = string
  default     = ""
}


variable "helm_repository_link" {
  description = "Helm Repository Link"
  type        = string
  default     = ""
}

# variable "helm_namespace" {
#   description = "Helm Repository Link"
#   type        = string
#   default     = ""
# }

variable "set_value_sa_create" {
  description = "Helm Repository Link"
  type        = string
  default     = "false"
}

variable "set_value_sa_name" {
  description = "Helm SA name"
  type        = string
  default     = "default"
}