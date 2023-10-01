data "oci_identity_user_group_memberships" "groups" {
  for_each                        = { 
    for label, setting in var.groups_list-all : label => setting
  }

  compartment_id                = var.tenancy_map.id
  group_id                      = each.value.id
  #user_id                       = 
}