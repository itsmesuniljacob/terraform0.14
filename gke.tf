locals {
  # Hack to work around https://github.com/hashicorp/terraform/issues/15605 and https://github.com/hashicorp/terraform/issues/16380
  gke_encryption_key = var.gke_encryption_state == "DECRYPTED" ? "" : google_kms_crypto_key.crypto_key.self_link
}

provider "kubernetes" {
  alias                  = "gke"
#   version                = "1.7"
  load_config_file       = false
  host                   = module.gke.gke_cluster_endpoint
  token                  = module.gke.google_client_config_access_token
  cluster_ca_certificate = base64decode(module.gke.gke_cluster_cluster_ca_certificate)
}

provider "helm" {
  alias          = "gke"
  install_tiller = false
#   version        = "1.3.1"
  kubernetes {
    host                   = module.gke.gke_cluster_endpoint
    token                  = module.gke.google_client_config_access_token
    cluster_ca_certificate = base64decode(module.gke.gke_cluster_cluster_ca_certificate)
    load_config_file       = false
  }
}

# module "gke" {
#   source             = "git::ssh://git@gitlab.com/falabella-gitlab/catalyst/devops/global-terraform0.12-modules.git//gke"
#   project_name       = var.project_name
#   environment        = "dev"
#   cluster_name       = var.gke_cluster_name
#   region             = var.region
#   network            = "${var.project_name}-network"
#   subnetwork         = "${var.project_name}-subnetwork"
#   gke_version        = "1.16"
#   gke_instance_type  = "n1-standard-4"
#   gke_auto_min_count = 1
#   gke_auto_max_count = 5
#   gke_preemptible    = true
#   max_pods_per_node  = 64

#   initial_node_count             = 1
#   node_pool_disk_size            = 100
#   oauth_scopes                   = var.oauth_scopes
#   daily_maintenance_window_start = "03:00"

#   master_ipv4_cidr_block        = "10.103.8.0/28"
#   cluster_secondary_range_name  = "gke-istio-cluster-ip-range"
#   services_secondary_range_name = "gke-istio-service-ip-range"

#   gke_encryption_state = "ENCRYPTED"
#   gke_encryption_key   = local.gke_encryption_key

#   disable_istio_addons = true
#   dns_cache_enabled    = true
# }

# module "tiller_gke" {
#   providers = {
#     kubernetes = "kubernetes.gke"
#   }

#   source                     = "git::ssh://git@git.fala.cl/catalyst/devops/global-terraform0.12-modules.git//tiller"
#   tiller_net_host            = true
#   tiller_replicas            = 1
#   tiller_version             = "v2.15.2"
#   tiller_namespace           = "kube-system"
#   tiller_node_selector       = {}
#   tiller_image               = "gcr.io/kubernetes-helm/tiller"
#   tiller_service_account     = "tiller"
#   tiller_max_history         = 0
#   gke_cluster_node_pool_name = module.gke.gke_cluster_nodepool_name
# }


#resource "kubernetes_secret" "gke_tls_certificate" {
#  provider = "kubernetes.gke"#

#  metadata {
#    name      = "istio-ingressgateway-certs"
#    namespace = "istio-system"
#  }#

#  data = {
#    "tls.crt" = var.ssl_server_certificate
#    "tls.key" = var.ssl_server_key
#  }#

#  type = "kubernetes.io/tls"#

#  depends_on = [module.gke]
#}
