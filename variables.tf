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
  default     = "core-commerce-dev"
}

variable "project_id" {
  type        = string
  description = "GCP project ID"
  default     = "core-commerce-dev"
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

variable "google_credentials" {
  type        = string
  description = "GCP SA account"
}
