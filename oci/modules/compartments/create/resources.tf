resource "oci_identity_compartment" "v0_1_0" {
  ##v0.1.0
  for_each                        = { 
    for label, setting in var.et_map-compartments : label => setting

    if  ( var.default_map-modules.enable              == true             &&                        #is the default module enabled
          var.et_map-modules.enable                   == true             &&
          setting.enable                              == true             &&                        #is the et module enabled
          setting.heirachy.relationship               == var.relationship &&                        #is this run for my heirachy relationship?
          ( var.default_map-modules.version           == "0.1.0"          ||                        #is the et module version 0.1.0 OR
            ( var.default_map-modules.version         == null             &&                        #is the et module version null AND
              var.default_map-modules.version         == "0.1.0"                                    #is the default module version 0.1.0
            )
          )
        )
  }
  
  compartment_id                  = ( 
      each.value.heirachy.parent                      == "root"           ? (                       #parent compartments
        var.tenancy_map.id 
    ) : (
                                                                                                    #names with no prefix or suffix
      length(each.value.prefix)                       == 0                && 
      length(each.value.suffix)                       == 0                && 
      length(var.et_map-modules.prefix)               == 0                &&
      length(var.et_map-modules.suffix)               == 0                &&
      length(var.default_map-modules.prefix)          == 0                && 
      length(var.default_map-modules.suffix)          == 0                ? ( 
        var.compartment_map[each.value.heirachy.parent].id
    ) : (
                                                                                                    #names with compartment prefix and no suffix
      length(each.value.prefix)                       == 1 &&
      length(each.value.suffix)                       == 0 &&
      length(var.default_map-modules.suffix)          == 0 && 
      length(var.et_map-modules.suffix)               == 0                ? (
        var.compartment_map["${each.value.prefix[0]}-${each.value.heirachy.parent}"].id
    ) : (
      length(each.value.prefix)                       >= 2 &&
      length(each.value.suffix)                       == 0 &&
      length(var.default_map-modules.suffix)          == 0 && 
      length(var.et_map-modules.suffix)               == 0                ? (
        var.compartment_map["${each.value.prefix[0]}-${each.value.prefix[1]}-${each.value.heirachy.parent}"].id
    ) : (
                                                                                                    #names with compartment prefix and compartment suffix
      length(each.value.prefix)                       == 1 &&
      length(each.value.suffix)                       >= 1      ? (
        var.compartment_map["${each.value.prefix[0]}-${each.value.heirachy.parent}-${each.value.suffix[0]}"].id
    ) : (
      length(each.value.prefix)                       >= 2 &&
      length(each.value.suffix)                       >= 1      ? (
        var.compartment_map["${each.value.prefix[0]}-${each.value.prefix[1]}-${each.value.heirachy.parent}-${each.value.suffix[0]}"].id
    ) : (
                                                                                                    #names with compartment prefix and et suffix
      length(each.value.prefix)                       == 1 &&
      length(each.value.suffix)                       == 0 &&
      length(var.et_map-modules.suffix)               >= 1      ? (
        var.compartment_map["${each.value.prefix[0]}-${each.value.heirachy.parent}-${var.et_map-modules.suffix[0]}"].id
    ) : (
      length(each.value.prefix)                       >= 2 &&
      length(each.value.suffix)                       == 0 &&
      length(var.et_map-modules.suffix)               >= 1      ? (
        var.compartment_map["${each.value.prefix[0]}-${each.value.prefix[1]}-${each.value.heirachy.parent}-${var.et_map-modules.suffix[0]}"].id
    ) : (
                                                                                                    #names with compartment prefix and default suffix
      length(each.value.prefix)                       == 1 &&
      length(each.value.suffix)                       == 0 &&
      length(var.default_map-modules.suffix)          >= 1 &&
      length(var.et_map-modules.suffix)               == 0      ? (
        var.compartment_map["${each.value.prefix[0]}-${each.value.heirachy.parent}-${var.default_map-modules.suffix[0]}"].id
    ) : (
      length(each.value.prefix)                       >= 2 &&
      length(each.value.suffix)                       == 0 &&
      length(var.default_map-modules.suffix)          >= 1 &&
      length(var.et_map-modules.suffix)               == 0      ? (
        var.compartment_map["${each.value.prefix[0]}-${each.value.prefix[1]}-${each.value.heirachy.parent}-${var.default_map-modules.suffix[0]}"].id
    ) : (
                                                                                                    #names with et prefix and no suffix
      length(each.value.prefix)                       == 0 && 
      length(each.value.suffix)                       == 0 && 
      length(var.et_map-modules.prefix)               == 1 &&
      length(var.default_map-modules.suffix)          == 0 && 
      length(var.et_map-modules.suffix)               == 0      ? (
        var.compartment_map["${var.et_map-modules.prefix[0]}-${each.value.heirachy.parent}"].id
    ) : (
      length(each.value.prefix)                       == 0 && 
      length(each.value.suffix)                       == 0 && 
      length(var.et_map-modules.prefix)               >= 2 &&
      length(var.default_map-modules.suffix)          == 0 && 
      length(var.et_map-modules.suffix)               == 0      ? (
        var.compartment_map["${var.et_map-modules.prefix[0]}-${var.et_map-modules.prefix[1]}-${each.value.heirachy.parent}"].id
    ) : (
                                                                                                    #names with et prefix and compartment suffix
      length(each.value.prefix)                       == 0 && 
      length(each.value.suffix)                       >= 1 && 
      length(var.et_map-modules.prefix)               == 1      ? (
        var.compartment_map["${var.et_map-modules.prefix[0]}-${each.value.heirachy.parent}-${each.value.suffix[0]}"].id
    ) : (
      length(each.value.prefix)                       == 0 && 
      length(each.value.suffix)                       >= 1 && 
      length(var.et_map-modules.prefix)               >= 2      ? (
        var.compartment_map["${var.et_map-modules.prefix[0]}-${var.et_map-modules.prefix[1]}-${each.value.heirachy.parent}-${each.value.suffix[0]}"].id
    ) : (
                                                                                                    #names with et prefix and et suffix
      length(each.value.prefix)                       == 0 && 
      length(each.value.suffix)                       == 0 && 
      length(var.et_map-modules.prefix)               == 1 &&
      length(var.et_map-modules.suffix)               >= 1      ? (
        var.compartment_map["${var.et_map-modules.prefix[0]}-${each.value.heirachy.parent}-${var.et_map-modules.suffix[0]}"].id
    ) : (
      length(each.value.prefix)                       == 0 && 
      length(each.value.suffix)                       == 0 && 
      length(var.et_map-modules.prefix)               >= 2 &&
      length(var.et_map-modules.suffix)               >= 1      ? (
        var.compartment_map["${var.et_map-modules.prefix[0]}-${var.et_map-modules.prefix[1]}-${each.value.heirachy.parent}-${var.et_map-modules.suffix[0]}"].id
    ) : (
                                                                                                    #names with et prefix and default suffix
      length(each.value.prefix)                       == 0 && 
      length(each.value.suffix)                       == 0 && 
      length(var.et_map-modules.prefix)               == 1 &&
      length(var.et_map-modules.suffix)               == 0 && 
      length(var.default_map-modules.suffix)          >= 1      ? (
        var.compartment_map["${var.et_map-modules.prefix[0]}-${each.value.heirachy.parent}-${var.default_map-modules.suffix[0]}"].id
    ) : (
      length(each.value.prefix)                       == 0 && 
      length(each.value.suffix)                       == 0 && 
      length(var.et_map-modules.prefix)               >= 2 &&
      length(var.et_map-modules.suffix)               == 0 && 
      length(var.default_map-modules.suffix)          >= 1      ? (
        var.compartment_map["${var.et_map-modules.prefix[0]}-${var.et_map-modules.prefix[1]}-${each.value.heirachy.parent}-${var.default_map-modules.suffix[0]}"].id
    ) : (
                                                                                                    #names with default prefix and no suffix
      length(each.value.prefix)                       == 0 && 
      length(each.value.suffix)                       == 0 && 
      length(var.et_map-modules.prefix)               == 0 &&
      length(var.et_map-modules.suffix)               == 0 && 
      length(var.default_map-modules.prefix)          == 1 &&
      length(var.default_map-modules.suffix)          == 0      ? (
        var.compartment_map["${var.default_map-modules.prefix[0]}-${each.value.heirachy.parent}"].id
    ) : (
      length(each.value.prefix)                       == 0 && 
      length(each.value.suffix)                       == 0 && 
      length(var.et_map-modules.prefix)               == 0 &&
      length(var.et_map-modules.suffix)               == 0 && 
      length(var.default_map-modules.prefix)          >= 2 &&
      length(var.default_map-modules.suffix)          == 0      ? (
        var.compartment_map["${var.default_map-modules.prefix[0]}-${var.default_map-modules.prefix[1]}-${each.value.heirachy.parent}-${each.value.suffix[0]}"].id
    ) : (
                                                                                                    #names with default prefix and compartment suffix
      length(each.value.prefix)                       == 0 && 
      length(each.value.suffix)                       >= 1 && 
      length(var.et_map-modules.prefix)               == 0 &&
      length(var.et_map-modules.suffix)               == 0 && 
      length(var.default_map-modules.prefix)          == 1 &&
      length(var.default_map-modules.suffix)          == 0      ? (
        var.compartment_map["${var.default_map-modules.prefix[0]}-${each.value.heirachy.parent}-${each.value.suffix[0]}"].id
    ) : (
      length(each.value.prefix)                       == 0 && 
      length(each.value.suffix)                       >= 1 && 
      length(var.et_map-modules.prefix)               == 0 &&
      length(var.et_map-modules.suffix)               == 0 && 
      length(var.default_map-modules.prefix)          >= 2 &&
      length(var.default_map-modules.suffix)          == 0      ? (
        var.compartment_map["${var.default_map-modules.prefix[0]}-${var.default_map-modules.prefix[1]}-${each.value.heirachy.parent}-${each.value.suffix[0]}"].id
    ) : (
                                                                                                    #names with default prefix and et suffix
      length(each.value.prefix)                       == 0 && 
      length(each.value.suffix)                       == 0 && 
      length(var.et_map-modules.prefix)               == 0 &&
      length(var.et_map-modules.suffix)               >= 1 && 
      length(var.default_map-modules.prefix)          == 1 &&
      length(var.default_map-modules.suffix)          == 0      ? (
        var.compartment_map["${var.default_map-modules.prefix[0]}-${each.value.heirachy.parent}-${var.et_map-modules.suffix[0]}"].id
    ) : (
      length(each.value.prefix)                       == 0 && 
      length(each.value.suffix)                       == 0 && 
      length(var.et_map-modules.prefix)               == 0 &&
      length(var.et_map-modules.suffix)               >= 1 && 
      length(var.default_map-modules.prefix)          >= 2 &&
      length(var.default_map-modules.suffix)          == 0      ? (
        var.compartment_map["${var.default_map-modules.prefix[0]}-${var.default_map-modules.prefix[1]}-${each.value.heirachy.parent}-${var.et_map-modules.suffix[0]}"].id
    ) : (
                                                                                                    #names with default prefix and default suffix
      length(each.value.prefix)                       == 0 && 
      length(each.value.suffix)                       == 0 && 
      length(var.et_map-modules.prefix)               == 0 &&
      length(var.et_map-modules.suffix)               == 0 && 
      length(var.default_map-modules.prefix)          == 1 &&
      length(var.default_map-modules.suffix)          >= 1      ? (
        var.compartment_map["${var.default_map-modules.prefix[0]}-${each.value.heirachy.parent}-${var.default_map-modules.suffix[0]}"].id
    ) : (
      length(each.value.prefix)                       == 0 && 
      length(each.value.suffix)                       == 0 && 
      length(var.et_map-modules.prefix)               == 0 &&
      length(var.et_map-modules.suffix)               == 0 && 
      length(var.default_map-modules.prefix)          >= 2 &&
      length(var.default_map-modules.suffix)          >= 1      ? (
        var.compartment_map["${var.default_map-modules.prefix[0]}-${var.default_map-modules.prefix[1]}-${each.value.heirachy.parent}-${var.default_map-modules.suffix[0]}"].id
    ) : (
                                                                                                    #yup you screwed up!
        "you should not see this"
  ))))))))))))))))))))))))))) 
                                                                                                    #enabling this will overwrite OCI auto create tags
  #defined_tags                    = each.value.compartment.defined_tags
  description                     = each.value.description
  enable_delete                   = each.value.enable_delete
  freeform_tags                   = each.value.tags.freeform
  name                            = ( 
                                                                                                    #names with no prefix or suffix
      length(each.value.prefix)                       == 0                && 
      length(each.value.suffix)                       == 0                && 
      length(var.et_map-modules.prefix)               == 0                &&
      length(var.et_map-modules.suffix)               == 0                &&
      length(var.default_map-modules.prefix)          == 0                && 
      length(var.default_map-modules.suffix)          == 0                ? ( 
        each.key
    ) : (
                                                                                                    #names with compartment prefix and no suffix
      length(each.value.prefix)                       == 1 &&
      length(each.value.suffix)                       == 0 &&
      length(var.default_map-modules.suffix)          == 0 && 
      length(var.et_map-modules.suffix)               == 0                ? (
        "${each.value.prefix[0]}-${each.key}"
    ) : (
      length(each.value.prefix)                       >= 2 &&
      length(each.value.suffix)                       == 0 &&
      length(var.default_map-modules.suffix)          == 0 && 
      length(var.et_map-modules.suffix)               == 0                ? (
        "${each.value.prefix[0]}-${each.value.prefix[1]}-${each.key}"
    ) : (
                                                                                                    #names with compartment prefix and compartment suffix
      length(each.value.prefix)                       == 1 &&
      length(each.value.suffix)                       >= 1      ? (
        "${each.value.prefix[0]}-${each.key}-${each.value.suffix[0]}"
    ) : (
      length(each.value.prefix)                       >= 2 &&
      length(each.value.suffix)                       >= 1      ? (
        "${each.value.prefix[0]}-${each.value.prefix[1]}-${each.key}-${each.value.suffix[0]}"
    ) : (
                                                                                                    #names with compartment prefix and et suffix
      length(each.value.prefix)                       == 1 &&
      length(each.value.suffix)                       == 0 &&
      length(var.et_map-modules.suffix)               >= 1      ? (
        "${each.value.prefix[0]}-${each.key}-${var.et_map-modules.suffix[0]}"
    ) : (
      length(each.value.prefix)                       >= 2 &&
      length(each.value.suffix)                       == 0 &&
      length(var.et_map-modules.suffix)               >= 1      ? (
        "${each.value.prefix[0]}-${each.value.prefix[1]}-${each.key}-${var.et_map-modules.suffix[0]}"
    ) : (
                                                                                                    #names with compartment prefix and default suffix
      length(each.value.prefix)                       == 1 &&
      length(each.value.suffix)                       == 0 &&
      length(var.default_map-modules.suffix)          >= 1 &&
      length(var.et_map-modules.suffix)               == 0      ? (
        "${each.value.prefix[0]}-${each.key}-${var.default_map-modules.suffix[0]}"
    ) : (
      length(each.value.prefix)                       >= 2 &&
      length(each.value.suffix)                       == 0 &&
      length(var.default_map-modules.suffix)          >= 1 &&
      length(var.et_map-modules.suffix)               == 0      ? (
        "${each.value.prefix[0]}-${each.value.prefix[1]}-${each.key}-${var.default_map-modules.suffix[0]}"
    ) : (
                                                                                                    #names with et prefix and no suffix
      length(each.value.prefix)                       == 0 && 
      length(each.value.suffix)                       == 0 && 
      length(var.et_map-modules.prefix)               == 1 &&
      length(var.default_map-modules.suffix)          == 0 && 
      length(var.et_map-modules.suffix)               == 0      ? (
        "${var.et_map-modules.prefix[0]}-${each.key}"
    ) : (
      length(each.value.prefix)                       == 0 && 
      length(each.value.suffix)                       == 0 && 
      length(var.et_map-modules.prefix)               >= 2 &&
      length(var.default_map-modules.suffix)          == 0 && 
      length(var.et_map-modules.suffix)               == 0      ? (
        "${var.et_map-modules.prefix[0]}-${var.et_map-modules.prefix[1]}-${each.key}"
    ) : (
                                                                                                    #names with et prefix and compartment suffix
      length(each.value.prefix)                       == 0 && 
      length(each.value.suffix)                       >= 1 && 
      length(var.et_map-modules.prefix)               == 1      ? (
        "${var.et_map-modules.prefix[0]}-${each.key}-${each.value.suffix[0]}"
    ) : (
      length(each.value.prefix)                       == 0 && 
      length(each.value.suffix)                       >= 1 && 
      length(var.et_map-modules.prefix)               >= 2      ? (
        "${var.et_map-modules.prefix[0]}-${var.et_map-modules.prefix[1]}-${each.key}-${each.value.suffix[0]}"
    ) : (
                                                                                                    #names with et prefix and et suffix
      length(each.value.prefix)                       == 0 && 
      length(each.value.suffix)                       == 0 && 
      length(var.et_map-modules.prefix)               == 1 &&
      length(var.et_map-modules.suffix)               >= 1      ? (
        "${var.et_map-modules.prefix[0]}-${each.key}-${var.et_map-modules.suffix[0]}"
    ) : (
      length(each.value.prefix)                       == 0 && 
      length(each.value.suffix)                       == 0 && 
      length(var.et_map-modules.prefix)               >= 2 &&
      length(var.et_map-modules.suffix)               >= 1      ? (
        "${var.et_map-modules.prefix[0]}-${var.et_map-modules.prefix[1]}-${each.key}-${var.et_map-modules.suffix[0]}"
    ) : (
                                                                                                    #names with et prefix and default suffix
      length(each.value.prefix)                       == 0 && 
      length(each.value.suffix)                       == 0 && 
      length(var.et_map-modules.prefix)               == 1 &&
      length(var.et_map-modules.suffix)               == 0 && 
      length(var.default_map-modules.suffix)          >= 1      ? (
        "${var.et_map-modules.prefix[0]}-${each.key}-${var.default_map-modules.suffix[0]}"
    ) : (
      length(each.value.prefix)                       == 0 && 
      length(each.value.suffix)                       == 0 && 
      length(var.et_map-modules.prefix)               >= 2 &&
      length(var.et_map-modules.suffix)               == 0 && 
      length(var.default_map-modules.suffix)          >= 1      ? (
        "${var.et_map-modules.prefix[0]}-${var.et_map-modules.prefix[1]}-${each.key}-${var.default_map-modules.suffix[0]}"
    ) : (
                                                                                                    #names with default prefix and no suffix
      length(each.value.prefix)                       == 0 && 
      length(each.value.suffix)                       == 0 && 
      length(var.et_map-modules.prefix)               == 0 &&
      length(var.et_map-modules.suffix)               == 0 && 
      length(var.default_map-modules.prefix)          == 1 &&
      length(var.default_map-modules.suffix)          == 0      ? (
        "${var.default_map-modules.prefix[0]}-${each.key}"
    ) : (
      length(each.value.prefix)                       == 0 && 
      length(each.value.suffix)                       == 0 && 
      length(var.et_map-modules.prefix)               == 0 &&
      length(var.et_map-modules.suffix)               == 0 && 
      length(var.default_map-modules.prefix)          >= 2 &&
      length(var.default_map-modules.suffix)          == 0      ? (
        "${var.default_map-modules.prefix[0]}-${var.default_map-modules.prefix[1]}-${each.key}-${each.value.suffix[0]}"
    ) : (
                                                                                                    #names with default prefix and compartment suffix
      length(each.value.prefix)                       == 0 && 
      length(each.value.suffix)                       >= 1 && 
      length(var.et_map-modules.prefix)               == 0 &&
      length(var.et_map-modules.suffix)               == 0 && 
      length(var.default_map-modules.prefix)          == 1 &&
      length(var.default_map-modules.suffix)          == 0      ? (
        "${var.default_map-modules.prefix[0]}-${each.key}-${each.value.suffix[0]}"
    ) : (
      length(each.value.prefix)                       == 0 && 
      length(each.value.suffix)                       >= 1 && 
      length(var.et_map-modules.prefix)               == 0 &&
      length(var.et_map-modules.suffix)               == 0 && 
      length(var.default_map-modules.prefix)          >= 2 &&
      length(var.default_map-modules.suffix)          == 0      ? (
        "${var.default_map-modules.prefix[0]}-${var.default_map-modules.prefix[1]}-${each.key}-${each.value.suffix[0]}"
    ) : (
                                                                                                    #names with default prefix and et suffix
      length(each.value.prefix)                       == 0 && 
      length(each.value.suffix)                       == 0 && 
      length(var.et_map-modules.prefix)               == 0 &&
      length(var.et_map-modules.suffix)               >= 1 && 
      length(var.default_map-modules.prefix)          == 1 &&
      length(var.default_map-modules.suffix)          == 0      ? (
        "${var.default_map-modules.prefix[0]}-${each.key}-${var.et_map-modules.suffix[0]}"
    ) : (
      length(each.value.prefix)                       == 0 && 
      length(each.value.suffix)                       == 0 && 
      length(var.et_map-modules.prefix)               == 0 &&
      length(var.et_map-modules.suffix)               >= 1 && 
      length(var.default_map-modules.prefix)          >= 2 &&
      length(var.default_map-modules.suffix)          == 0      ? (
        "${var.default_map-modules.prefix[0]}-${var.default_map-modules.prefix[1]}-${each.key}-${var.et_map-modules.suffix[0]}"
    ) : (
                                                                                                    #names with default prefix and default suffix
      length(each.value.prefix)                       == 0 && 
      length(each.value.suffix)                       == 0 && 
      length(var.et_map-modules.prefix)               == 0 &&
      length(var.et_map-modules.suffix)               == 0 && 
      length(var.default_map-modules.prefix)          == 1 &&
      length(var.default_map-modules.suffix)          >= 1      ? (
        "${var.default_map-modules.prefix[0]}-${each.key}-${var.default_map-modules.suffix[0]}"
    ) : (
      length(each.value.prefix)                       == 0 && 
      length(each.value.suffix)                       == 0 && 
      length(var.et_map-modules.prefix)               == 0 &&
      length(var.et_map-modules.suffix)               == 0 && 
      length(var.default_map-modules.prefix)          >= 2 &&
      length(var.default_map-modules.suffix)          >= 1      ? (
        "${var.default_map-modules.prefix[0]}-${var.default_map-modules.prefix[1]}-${each.key}-${var.default_map-modules.suffix[0]}"
    ) : (
                                                                                                    #yup you screwed up!
        "you should not see this"
  )))))))))))))))))))))))))) 
}