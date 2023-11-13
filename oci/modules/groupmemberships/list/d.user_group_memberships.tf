data "oci_identity_user_group_memberships" "list" {
    compartment_id                  = var.id

    #group_id                        = null
    #user_id                         = null
}