terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.50.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "3.50.0"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "2.15.0"
    }
  }
}
# provider "google-beta" {
#   version = "3.21.0"
#   project = var.project_id
#   region  = var.region
#   }

# provider "cloudflare" {
#   version = "2.1.0"
#   email   = var.cloudflare_email
#   api_key = var.cloudflare_api_key
#   } 

