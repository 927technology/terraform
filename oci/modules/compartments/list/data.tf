data "oci_identity_compartments" "list" {
    access_level                  = var.access_level
    compartment_id                = var.id
    compartment_id_in_subtree     = true
    name                          = var.name
    state                         = var.state
}