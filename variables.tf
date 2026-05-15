variable "gcp_project_id" {
  description = "The GCP project ID."
  type        = string

}

variable "region" {
  description = "The GCP region to deploy resources in."
  type        = string
}

# variable "cluster_name" {
#   description = "Name of the cluster"
#   type        = string
#   default     = ""
# }

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
  default     = "velero"
}


variable "helm_repository_link" {
  description = "Helm Repository Link"
  type        = string
  default     = "https://vmware-tanzu.github.io/helm-charts"
}

# variable "helm_namespace" {
#   description = "Helm Repository Link"
#   type        = string
#   default     = ""
# }

# variable "set_value_sa_create" {
#   description = "Helm Repository Link"
#   type        = string
#   default     = "false"
# }

# variable "set_value_sa_name" {
#   description = "Helm SA name"
#   type        = string
#   default     = "default"
# }

variable "set_inputs" {
  description = "List of set inputs (e.g. name1:val1,name2:value2)"
  type        = string
}
