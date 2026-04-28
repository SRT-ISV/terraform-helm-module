variable "gcp_project_id" {
  description = "The GCP project ID."
  type        = string

}

variable "region" {
  description = "The GCP region to deploy resources in."
  type        = string
}

variable "cluster_id" {
  description = "ID of the cluster"
  type        = string
}

variable "chart" {
  description = "Location of helm chart"
  type        = string
}


variable "helm_repository_link" {
  description = "Helm Repository Link"
  type        = string
}

# variable "helm_namespace" {
#   description = "Helm Repository Link"
#   type        = string
#   default     = ""
# }

variable "set_value_sa_create" {
  description = "Helm Repository Link"
  type        = string
}

variable "set_value_sa_name" {
  description = "Helm SA name"
  type        = string
}