resource "oci_identity_group" "v0_1_0" {
  for_each                          = { 
    for label, setting in var.et_map.groups : label => setting

    if  ( var.default_map.modules["groups"].enable                    == true             &&        #is the default module enabled
          var.et_map.modules["groups"].enable                         == true             &&
          setting.enable                                              == true             &&        #is the et module enabled
          ( var.et_map.modules["groups"].version                      == "0.1.0"          ||        #is the et module version 0.1.0 OR
            ( var.et_map.modules["groups"].version                    == null             &&        #is the et module version null AND
              var.default_map.modules["groups"].version               == "0.1.0"                    #is the default module version 0.1.0
            )
          )
        )
  }
  
  compartment_id                    = var.compartment_map[each.value.compartment].id
  defined_tags                      = each.value.tags.defined
  description                       = each.value.description
  freeform_tags                     = each.value.tags.freeform
  name                              = each.value.tags.freeform.label
}