resource "oci_identity_user" "v0_1_0" {
  for_each                        = { 
    for label, setting in var.et_map-users : label => setting
    # for index, setting in var.et_map-users : setting.name => setting

    if  ( var.default_map-users.enable                        == true     &&                                  #is the default module enabled
          var.et_map-modules.enable                           == true     &&
          setting.enable                                      == true     &&                                  #is the et module enabled
          ( var.et_map-modules.version                        == "0.1.0"  ||                                  #is the et module version 0.1.0 OR
            ( var.et_map-modules.version                      == null     &&                                  #is the et module version null AND
              var.default_map-users.version                   == "0.1.0"                                      #is the default module version 0.1.0
            )
          )
        )
  }
  
  compartment_id                  = (
    each.value.parent                                         == "root"   ? (
      var.tenancy_map.id 
    ) : (
      var.compartment_map[each.value.parent].id
    ))  
  defined_tags                    = each.value.tags.defined
  description                     = each.value.description
  email                           = each.value.user.email
  freeform_tags                   = each.value.tags.freeform
  name                            = each.value.user.name
}