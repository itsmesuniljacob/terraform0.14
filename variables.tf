# variable "oauth_scopes" {
#   description = "oauth scopes for gke cluster"
#   type        = list(string)
#   default     = [
#       "https://www.googleapis.com/auth/compute",
#       "https://www.googleapis.com/auth/cloud-platform",
#       "https://www.googleapis.com/auth/devstorage.read_only",
#       "https://www.googleapis.com/auth/taskqueue",
#       "https://www.googleapis.com/auth/sqlservice.admin",
#       "https://www.googleapis.com/auth/monitoring.write",
#       "https://www.googleapis.com/auth/servicecontrol",
#       "https://www.googleapis.com/auth/service.management.readonly",
#       "https://www.googleapis.com/auth/trace.append",
#       "https://www.googleapis.com/auth/monitoring",
#       "https://www.googleapis.com/auth/logging.write",
#       "https://www.googleapis.com/auth/pubsub",
#       "https://www.googleapis.com/auth/cloud_debugger",
#   ]
# }

variable "project_name" {
  type        = string
  description = "GCP project Name"
  default     = "terraform14"
}

variable "project_id" {
  type        = string
  description = "GCP project ID"
  default     = "terraform0"
}

# variable "gke_encryption_state" {
#   type        = string
#   description = "gke cluster encryption state"
#   default     = "ENCRYPTED"
# }

variable "region" {
  type        = string
  description = "Region for creating the resource"
  default     = "us-east4"
}

# variable "gke_cluster_name" {
#   type        = string
#   description = "Name of GKE cluster"
#   default     = "gke-istio-16"
# }

# variable "google_credentials" {
#   type        = string
#   description = "GCP SA account"
# }

variable "gke_encryption_state" {
  type        = string
  description = "the state of encryption key"
}

variable "gke_encryption_key" {
  type        = string
  description = "GKE encryption key"
  
}
variable "zone" {
  description = "Google Cloud zone"
  type        = string
  default     = "us-east4-a"
}

variable "machine_type" {
  description = "Google VM Instance type."
  type        = string
}
variable "istio_version" {
  type  = string
  description = "istio version"
  default     = "1.6.7"
}

variable "gke_namespaces" {
  type        = set(string)
  description = "namespaces"
}