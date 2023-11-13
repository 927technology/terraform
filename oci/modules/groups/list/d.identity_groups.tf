data "oci_identity_groups" "list"   {
    compartment_id                  = var.id
    #name                            = var.name
    state                           = var.state
}