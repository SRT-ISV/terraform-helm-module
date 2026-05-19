variable "gcp_project_id" {
  description = "The GCP project ID."
  type        = string
  #default     = ""

}

variable "helm_release_name" {
  description = "helm release name."
  type        = string
  default     = "velero-demo"
  
}

variable "artifact_registry_repo_name" {
  description = "The GCP project ID."
  type        = string
  default     = "oci-images"

}


variable "region" {
  description = "The GCP region to deploy resources in."
  type        = string
}

variable "zone" {
  description = "The GCP zone to deploy resources in."
  type        = string
}

variable "cluster_id" {
  description = "ID of the cluster"
  type        = string
}


variable "helm_namespace" {
  description = "GKE name space"
  type        = string
  default     = "velero"
}

variable "chart" {
  description = "Location of helm chart"
  type        = string
  default     = "velero"
}



variable "set_inputs" {
  description = "List of set inputs (e.g. name1:val1,name2:value2)"
  type        = string
}
