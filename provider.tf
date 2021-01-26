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

provider "google-beta" {
  project = var.project_id
}

