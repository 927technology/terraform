resource "oci_identity_compartment" "compartment" {
  
  for_each              = { 
    for app, setting in var.compartment-instance_map : app => setting

    if setting.enable == true
  }
  
  compartment_id        = var.compartment-region_map[var.compartment-et_map[var.compartment-et].region].id

                                                                                                    #enabling this will overwrite OCI auto create tags
  #defined_tags          = each.value.compartment.defined_tags
  
  description           = var.compartment-et_map[var.compartment-et].prefix != null && var.compartment-et_map[var.compartment-et].suffix != null ? "${each.value.display_name} Resource for ${var.compartment-et_map[var.compartment-et].prefix}-${var.compartment-et_map[var.compartment-et].suffix}" : ( var.compartment-et_map[var.compartment-et].prefix == null ?  "${each.value.display_name} Resource for ${var.compartment-et_map[var.compartment-et].suffix}" : ( var.compartment-et_map[var.compartment-et].suffix == null ? "${each.value.display_name} Resource for ${var.compartment-et_map[var.compartment-et].prefix}" : "you shouldnt see this" ))
  #description           = "${each.value.display_name} Resource for ${var.compartment-et_map[var.compartment-et].prefix}-${var.compartment-et_map[var.compartment-et].suffix}"
  enable_delete         = each.value.compartment.enable_delete
  freeform_tags         = each.value.compartment.freeform_tags
  name                  = var.compartment-et_map[var.compartment-et].prefix != null && var.compartment-et_map[var.compartment-et].suffix != null ? "${var.compartment-et_map[var.compartment-et].prefix}-${var.compartment-et_map[var.compartment-et].suffix}-${each.value.name}-cmp" : ( var.compartment-et_map[var.compartment-et].prefix == null ?  "${var.compartment-et_map[var.compartment-et].suffix}-${each.value.name}-cmp" : ( var.compartment-et_map[var.compartment-et].suffix == null ? "${var.compartment-et_map[var.compartment-et].prefix}-${each.value.name}-cmp" : "you shouldnt see this" ))
  #name                  = "${var.compartment-et_map[var.compartment-et].prefix}-${var.compartment-et_map[var.compartment-et].suffix}-${each.value.name}-cmp"
  
  #holdover from prsi codebase.  what does this do?
  #compute               = each.value.compute

}