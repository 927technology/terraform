data "oci_identity_users" "list" {
  compartment_id                  = var.id
  external_identifier             = var.external_id
  identity_provider_id            = var.provider_id
  name                            = var.name
  state                           = var.state
}