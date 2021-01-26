locals {
  # Hack to work around https://github.com/hashicorp/terraform/issues/15605 and https://github.com/hashicorp/terraform/issues/16380
  gke_encryption_key = var.gke_encryption_state == "DECRYPTED" ? "" : google_kms_crypto_key.crypto_key.self_link
}

resource "google_project_iam_member" "container_service_account" {
    role = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
    member = "serviceAccount:service-${data.google_project.project.number}@container-engine-robot.iam.gserviceaccount.com"
}
provider "kubernetes" {
  alias                  = "gke"
  load_config_file       = false
  host                   = module.gke.gke_cluster_endpoint
  token                  = module.gke.google_client_config_access_token
  cluster_ca_certificate = base64decode(module.gke.gke_cluster_cluster_ca_certificate)
}

provider "helm" {
  alias          = "gke"
  install_tiller = false
  kubernetes {
    host                   = module.gke.gke_cluster_endpoint
    token                  = module.gke.google_client_config_access_token
    cluster_ca_certificate = base64decode(module.gke.gke_cluster_cluster_ca_certificate)
    load_config_file       = false
  }
}

resource "google_container_cluster" "my_k8s_cluster" {
    provider           = google-beta
    name               = "terraform-istio"
    location           = "us-east4"
    initial_node_count = 1
    project            = var.project_id

    database_encryption {
      state            = var.gke_encryption_state
      key_name         = local.gke_encryption_key
    }
    node_config {
      preemptible  = true
      machine_type = var.machine_type
      oauth_scopes = [
        "https://www.googleapis.com/auth/logging.write",
        "https://www.googleapis.com/auth/monitoring",
      ]
      metadata = {
        "disable-legacy-endpoints" = "true"
      }

      labels = {
        "environment" = "test"
        "team"        = "devops"
        "project"     = "terraform14"
      }
    }
}

resource "null_resource" "download_istio" {
  triggers = {
    on_version_change = var.istio_version
  }
  provisioner "local-exec" {
    command = "curl -L https://istio.io/downloadIstio | ISTIO_VERSION=${var.istio_version} TARGET_ARCH=x86_64 sh -"
  }

  provisioner "local-exec" {
    when    = destroy
    command = "rm -rf ${self.triggers.on_version_change}"
  }
}
# resource "helm_release" "istio-operator" {
#   name       = istio-operator
#   chart      = "manifests/charts/istio-operator" 
#   namespace  = "istio-system"
#   values     =  [var.chart-values] 
#   skip_crds = true
# }
