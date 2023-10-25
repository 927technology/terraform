resource "oci_identity_compartment" "v0_1_1" {
  ##v0.1.1
  for_each                        = { 
    #for label, setting in var.et_map-compartments : label => setting
    for setting in var.et_map.compartments : setting.tags.freeform.label => setting

    if  ( var.default_map.modules.compartments.enable       == true             &&                  #is the default module enabled
          var.et_map.modules.compartments.enable            == true             &&
          setting.enable                                    == true             &&                  #is the et module enabled
          setting.heirachy.relationship                     == var.relationship &&                  #is this run for my heirachy relationship?
          ((var.default_map.modules.compartments.version    == "0.1.1"          &&                  #is the et module version 0.1.0 OR
            var.et_map.modules.compartments.version         == null     )       ||
           (var.et_map.modules.compartments.version         == "0.1.1"  )
          )
        )
  }
  
  compartment_id                  = ( 
      each.value.heirachy.parent                            == "root"           ? (                 #parent compartments
        var.tenancy_map.id 
    ) : (
        var.compartments_map[each.value.heirachy.parent].id
    ))

  #defined_tags                    = each.value.compartment.defined_tags
  description                     = each.value.description
  enable_delete                   = each.value.enable_delete
  freeform_tags                   = each.value.tags.freeform
  name                            = ( 
                                                                                                    #names with no prefix or suffix
      length(each.value.prefix)                             == 0                && 
      length(each.value.suffix)                             == 0                && 
      length(var.et_map.modules.compartments.prefix)        == 0                &&
      length(var.et_map.modules.compartments.suffix)        == 0                &&
      length(var.default_map.modules.compartments.prefix)   == 0                && 
      length(var.default_map.modules.compartments.suffix)   == 0                ? ( 
        each.value.tags.freeform.label
    ) : (
                                                                                                    #names with compartment prefix and no suffix
      length(each.value.prefix)                             == 1                &&
      length(each.value.suffix)                             == 0                &&
      length(var.default_map.modules.compartments.suffix)   == 0                && 
      length(var.et_map.modules.compartments.suffix)        == 0                ? (
        "${each.value.prefix[0]}-${each.value.tags.freeform.label}"
    ) : (
      length(each.value.prefix)                             >= 2                &&
      length(each.value.suffix)                             == 0                &&
      length(var.default_map.modules.compartments.suffix)   == 0                && 
      length(var.et_map.modules.compartments.suffix)        == 0                ? (
        "${each.value.prefix[0]}-${each.value.prefix[1]}-${each.value.tags.freeform.label}"
    ) : (
                                                                                                    #names with compartment prefix and compartment suffix
      length(each.value.prefix)                             == 1                &&
      length(each.value.suffix)                             >= 1                ? (
        "${each.value.prefix[0]}-${each.value.tags.freeform.label}-${each.value.suffix[0]}"
    ) : (
      length(each.value.prefix)                             >= 2                &&
      length(each.value.suffix)                             >= 1                ? (
        "${each.value.prefix[0]}-${each.value.prefix[1]}-${each.value.tags.freeform.label}-${each.value.suffix[0]}"
    ) : (
                                                                                                    #names with compartment prefix and et suffix
      length(each.value.prefix)                             == 1                &&
      length(each.value.suffix)                             == 0                &&
      length(var.et_map.modules.compartments.suffix)        >= 1                ? (
        "${each.value.prefix[0]}-${each.value.tags.freeform.label}-${var.et_map.modules.compartments.suffix[0]}"
    ) : (
      length(each.value.prefix)                             >= 2                &&
      length(each.value.suffix)                             == 0                &&
      length(var.et_map.modules.compartments.suffix)        >= 1                ? (
        "${each.value.prefix[0]}-${each.value.prefix[1]}-${each.value.tags.freeform.label}-${var.et_map.modules.compartments.suffix[0]}"
    ) : (
                                                                                                    #names with compartment prefix and default suffix
      length(each.value.prefix)                             == 1                &&
      length(each.value.suffix)                             == 0                &&
      length(var.default_map.modules.compartments.suffix)   >= 1                &&
      length(var.et_map.modules.compartments.suffix)        == 0                ? (
        "${each.value.prefix[0]}-${each.value.tags.freeform.label}-${var.default_map.modules.compartments.suffix[0]}"
    ) : (
      length(each.value.prefix)                             >= 2                &&
      length(each.value.suffix)                             == 0                &&
      length(var.default_map.modules.compartments.suffix)   >= 1                &&
      length(var.et_map.modules.compartments.suffix)        == 0                ? (
        "${each.value.prefix[0]}-${each.value.prefix[1]}-${each.value.tags.freeform.label}-${var.default_map.modules.compartments.suffix[0]}"
    ) : (
                                                                                                    #names with et prefix and no suffix
      length(each.value.prefix)                             == 0                && 
      length(each.value.suffix)                             == 0                && 
      length(var.et_map.modules.compartments.prefix)        == 1                &&
      length(var.default_map.modules.compartments.suffix)   == 0                && 
      length(var.et_map.modules.compartments.suffix)        == 0                ? (
        "${var.et_map.modules.compartments.prefix[0]}-${each.value.tags.freeform.label}"
    ) : (
      length(each.value.prefix)                             == 0                && 
      length(each.value.suffix)                             == 0                && 
      length(var.et_map.modules.compartments.prefix)        >= 2                &&
      length(var.default_map.modules.compartments.suffix)   == 0                && 
      length(var.et_map.modules.compartments.suffix)        == 0                ? (
        "${var.et_map.modules.compartments.prefix[0]}-${var.et_map.modules.compartments.prefix[1]}-${each.value.tags.freeform.label}"
    ) : (
                                                                                                    #names with et prefix and compartment suffix
      length(each.value.prefix)                             == 0                && 
      length(each.value.suffix)                             >= 1                && 
      length(var.et_map.modules.compartments.prefix)        == 1                ? (
        "${var.et_map.modules.compartments.prefix[0]}-${each.value.tags.freeform.label}-${each.value.suffix[0]}"
    ) : (
      length(each.value.prefix)                             == 0                && 
      length(each.value.suffix)                             >= 1                && 
      length(var.et_map.modules.compartments.prefix)        >= 2                ? (
        "${var.et_map.modules.compartments.prefix[0]}-${var.et_map.modules.compartments.prefix[1]}-${each.value.tags.freeform.label}-${each.value.suffix[0]}"
    ) : (
                                                                                                    #names with et prefix and et suffix
      length(each.value.prefix)                             == 0                && 
      length(each.value.suffix)                             == 0                && 
      length(var.et_map.modules.compartments.prefix)        == 1                &&
      length(var.et_map.modules.compartments.suffix)        >= 1                ? (
        "${var.et_map.modules.compartments.prefix[0]}-${each.value.tags.freeform.label}-${var.et_map.modules.compartments.suffix[0]}"
    ) : (
      length(each.value.prefix)                             == 0                && 
      length(each.value.suffix)                             == 0                && 
      length(var.et_map.modules.compartments.prefix)        >= 2                &&
      length(var.et_map.modules.compartments.suffix)        >= 1                ? (
        "${var.et_map.modules.compartments.prefix[0]}-${var.et_map.modules.compartments.prefix[1]}-${each.value.tags.freeform.label}-${var.et_map.modules.compartments.suffix[0]}"
    ) : (
                                                                                                    #names with et prefix and default suffix
      length(each.value.prefix)                             == 0                && 
      length(each.value.suffix)                             == 0                && 
      length(var.et_map.modules.compartments.prefix)        == 1                &&
      length(var.et_map.modules.compartments.suffix)        == 0                && 
      length(var.default_map.modules.compartments.suffix)   >= 1                ? (
        "${var.et_map.modules.compartments.prefix[0]}-${each.value.tags.freeform.label}-${var.default_map.modules.compartments.suffix[0]}"
    ) : (
      length(each.value.prefix)                             == 0                && 
      length(each.value.suffix)                             == 0                && 
      length(var.et_map.modules.compartments.prefix)        >= 2                &&
      length(var.et_map.modules.compartments.suffix)        == 0                && 
      length(var.default_map.modules.compartments.suffix)   >= 1                ? (
        "${var.et_map.modules.compartments.prefix[0]}-${var.et_map.modules.compartments.prefix[1]}-${each.value.tags.freeform.label}-${var.default_map.modules.compartments.suffix[0]}"
    ) : (
                                                                                                    #names with default prefix and no suffix
      length(each.value.prefix)                             == 0                && 
      length(each.value.suffix)                             == 0                && 
      length(var.et_map.modules.compartments.prefix)        == 0                &&
      length(var.et_map.modules.compartments.suffix)        == 0                && 
      length(var.default_map.modules.compartments.prefix)   == 1                &&
      length(var.default_map.modules.compartments.suffix)   == 0                ? (
        "${var.default_map.modules.compartments.prefix[0]}-${each.value.tags.freeform.label}"
    ) : (
      length(each.value.prefix)                             == 0                && 
      length(each.value.suffix)                             == 0                && 
      length(var.et_map.modules.compartments.prefix)        == 0                &&
      length(var.et_map.modules.compartments.suffix)        == 0                && 
      length(var.default_map.modules.compartments.prefix)   >= 2                &&
      length(var.default_map.modules.compartments.suffix)   == 0                ? (
        "${var.default_map.modules.compartments.prefix[0]}-${var.default_map.modules.compartments.prefix[1]}-${each.value.tags.freeform.label}-${each.value.suffix[0]}"
    ) : (
                                                                                                    #names with default prefix and compartment suffix
      length(each.value.prefix)                             == 0                && 
      length(each.value.suffix)                             >= 1                && 
      length(var.et_map.modules.compartments.prefix)        == 0                &&
      length(var.et_map.modules.compartments.suffix)        == 0                && 
      length(var.default_map.modules.compartments.prefix)   == 1                &&
      length(var.default_map.modules.compartments.suffix)   == 0                ? (
        "${var.default_map.modules.compartments.prefix[0]}-${each.value.tags.freeform.label}-${each.value.suffix[0]}"
    ) : (
      length(each.value.prefix)                             == 0                && 
      length(each.value.suffix)                             >= 1                && 
      length(var.et_map.modules.compartments.prefix)        == 0                &&
      length(var.et_map.modules.compartments.suffix)        == 0                && 
      length(var.default_map.modules.compartments.prefix)   >= 2                &&
      length(var.default_map.modules.compartments.suffix)   == 0                ? (
        "${var.default_map.modules.compartments.prefix[0]}-${var.default_map.modules.compartments.prefix[1]}-${each.value.tags.freeform.label}-${each.value.suffix[0]}"
    ) : (
                                                                                                    #names with default prefix and et suffix
      length(each.value.prefix)                             == 0                && 
      length(each.value.suffix)                             == 0                && 
      length(var.et_map.modules.compartments.prefix)        == 0                &&
      length(var.et_map.modules.compartments.suffix)        >= 1                && 
      length(var.default_map.modules.compartments.prefix)   == 1                &&
      length(var.default_map.modules.compartments.suffix)   == 0                ? (
        "${var.default_map.modules.compartments.prefix[0]}-${each.value.tags.freeform.label}-${var.et_map.modules.compartments.suffix[0]}"
    ) : (
      length(each.value.prefix)                             == 0                && 
      length(each.value.suffix)                             == 0                && 
      length(var.et_map.modules.compartments.prefix)        == 0                &&
      length(var.et_map.modules.compartments.suffix)        >= 1                && 
      length(var.default_map.modules.compartments.prefix)   >= 2                &&
      length(var.default_map.modules.compartments.suffix)   == 0                ? (
        "${var.default_map.modules.compartments.prefix[0]}-${var.default_map.modules.compartments.prefix[1]}-${each.value.tags.freeform.label}-${var.et_map.modules.compartments.suffix[0]}"
    ) : (
                                                                                                    #names with default prefix and default suffix
      length(each.value.prefix)                             == 0                && 
      length(each.value.suffix)                             == 0                && 
      length(var.et_map.modules.compartments.prefix)        == 0                &&
      length(var.et_map.modules.compartments.suffix)        == 0                && 
      length(var.default_map.modules.compartments.prefix)   == 1                &&
      length(var.default_map.modules.compartments.suffix)   >= 1                ? (
        "${var.default_map.modules.compartments.prefix[0]}-${each.value.tags.freeform.label}-${var.default_map.modules.compartments.suffix[0]}"
    ) : (
      length(each.value.prefix)                             == 0                && 
      length(each.value.suffix)                             == 0                && 
      length(var.et_map.modules.compartments.prefix)        == 0                &&
      length(var.et_map.modules.compartments.suffix)        == 0                && 
      length(var.default_map.modules.compartments.prefix)   >= 2                &&
      length(var.default_map.modules.compartments.suffix)   >= 1                ? (
        "${var.default_map.modules.compartments.prefix[0]}-${var.default_map.modules.compartments.prefix[1]}-${each.value.tags.freeform.label}-${var.default_map.modules.compartments.suffix[0]}"
    ) : (
                                                                                                    #yup you screwed up!
        "you should not see this"
  )))))))))))))))))))))))))) 
}