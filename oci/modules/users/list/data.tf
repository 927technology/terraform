data "oci_identity_users" "list" {
    compartment_id                = var.id
    #external_identifier           = var.user_external_identifier
    #identity_provider_id          = oci_identity_identity_provider.test_identity_provider.id
    #name                          = var.user_name
    state                         = var.state
}