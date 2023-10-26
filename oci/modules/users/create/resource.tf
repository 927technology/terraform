resource "oci_identity_user" "v0_1_0" {
  for_each                        = { 
  for setting in var.et_map.users : setting.tags.freeform.label => setting

  if  ( var.et_map.modules["users"].enable              == true             &&
        var.default_map.modules["users"].enable         == true             &&
        setting.enable                                  == true             &&                        #is the et module enabled
        ( var.default_map.modules["users"].version      == "0.1.0"          ||                        #is the et module version 0.1.0 OR
          ( var.default_map.modules["users"].version    == null             &&                        #is the et module version null AND
            var.default_map.modules["users"].version    == "0.1.0"                                    #is the default module version 0.1.0
          )
        )
      )
  }
  
  compartment_id                  = (
    each.value.compartment                              == "root"           ? (
      var.id 
    ) : (
      var.compartment_map[each.value.compartment].id
    ))  
  defined_tags                    = each.value.tags.defined
  description                     = each.value.description
  email                           = each.value.user.email
  freeform_tags                   = each.value.tags.freeform
  name                            = each.value.tags.freeform.label
}