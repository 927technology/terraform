data "oci_identity_users" "list"    {
    compartment_id                  = var.id
    #external_identifier             = null
    #identity_provider_id            = null
    #name                            = null
    state                           = var.state
}