# resource "helm_release" "istio-operator" {
#   name       = "istio-operator"
#   repository = "${data.helm_repository.istio.metadata.0.name}"
#   chart      = "istio-init"
#   version    = "${var.istio_version}"
#   namespace  = "${var.istio_namespace}"
# }
