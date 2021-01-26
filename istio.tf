# resource "kubernetes_namespace" "istio" {
#   provider   = "kubernetes.gke"
#   metadata {
#     annotations = {
#       name = "istio-system"
#     }

#     name = "istio-system"
#   }
# }

# resource "google_compute_address" "gke_istio_ingress_ip" {
#   name         = "gke-istio-cluster-ip"
#   address_type = "EXTERNAL"
# }

# module "istio_gke" {
#   source       = "git::ssh://git@git.fala.cl/catalyst/devops/global-terraform0.12-modules.git//addons/istio-1.7.3?ref=istio_17"
#   gke_cluster  = var.gke_cluster_name
#   region       = var.region
#   project_id   = var.project_id
#   ingress_ip   = google_compute_address.gke_istio_ingress_ip.address
#   istio_values = file("istio-values.yaml")
#   google_credentials = var.google_credentials
# }
