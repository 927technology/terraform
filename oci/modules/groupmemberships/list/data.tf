data "oci_identity_user_group_memberships" "list" {
    compartment_id                  = var.id

    #group_id = oci_identity_group.test_group.id
    #user_id = oci_identity_user.test_user.id
}