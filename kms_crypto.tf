# resource "google_kms_key_ring" "key_ring" {
#   name     = "istio16-key-ring"
#   project  = var.project_id
#   location = var.region
# }

# resource "google_kms_crypto_key" "crypto_key" {
#   name            = "istio16-crypto-key"
#   key_ring        = google_kms_key_ring.key_ring.self_link
#   rotation_period = "100000s"

#   lifecycle {
#     prevent_destroy = true
#   }
# }
