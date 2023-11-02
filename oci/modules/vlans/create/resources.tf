resource "oci_core_vlan" "v0_1_0" {
      for_each                        = ({
      for setting in var.et_map.vlans :
        setting.tags.freeform.label => setting


      if  ( var.et_map.modules["vlans"].enable      == true             &&
        var.default_map.modules["vlans"].enable     == true             &&
        setting.enable                              == true             &&                        #is the et module enabled
        ( var.default_map.modules["vlans"].version  == "0.1.0"          ||                        #is the et module version 0.1.0 OR
          ( var.default_map.modules["vlans"].version== null             &&                        #is the et module version null AND
            var.default_map.modules["vlans"].version== "0.1.0"                                    #is the default module version 0.1.0
          )
        )
      )
    }) 



    #availability_domain             = 

    cidr_block                      = each.value.cidr_block
    compartment_id                  = var.compartment_map[each.value.compartment].id
    defined_tags                    = each.value.tags.defined
    display_name                    = ( 
                                                                                                    #names with no prefix or suffix
      length(each.value.prefix)                             == 0                && 
      length(each.value.suffix)                             == 0                && 
      length(var.default_map["vlans"].prefix)               == 0                && 
      length(var.default_map["vlans"].suffix)               == 0                ? ( 
        each.value.tags.freeform.label
    ) : (
                                                                                                    #names with vcn prefix and no suffix
      length(each.value.prefix)                             == 1                &&
      length(each.value.suffix)                             == 0                &&
      length(var.default_map["vlans"].suffix)               == 0                ? ( 
        "${each.value.prefix[0]}-${each.value.tags.freeform.label}"
    ) : (
      length(each.value.prefix)                             >= 2                &&
      length(each.value.suffix)                             == 0                &&
      length(var.default_map["vlans"].suffix)               == 0                ? ( 
        "${each.value.prefix[0]}-${each.value.prefix[1]}-${each.value.tags.freeform.label}"
    ) : (
                                                                                                    #names with vcn prefix and suffix
      length(each.value.prefix)                             == 1                &&
      length(each.value.suffix)                             >= 1                ? (
        "${each.value.prefix[0]}-${each.value.tags.freeform.label}-${each.value.suffix[0]}"
    ) : (
      length(each.value.prefix)                             >= 2                &&
      length(each.value.suffix)                             >= 1                ? (
        "${each.value.prefix[0]}-${each.value.prefix[1]}-${each.value.tags.freeform.label}-${each.value.suffix[0]}"
    ) : (
                                                                                                    #names with vcn prefix and default suffix
      length(each.value.prefix)                             == 1                &&
      length(each.value.suffix)                             == 0                &&
      length(var.default_map["vlans"].suffix)               >= 1                ? (
        "${each.value.prefix[0]}-${each.value.tags.freeform.label}-${var.default_map["vlans"].suffix[0]}"
    ) : (
      length(each.value.prefix)                             >= 2                &&
      length(each.value.suffix)                             == 0                &&
      length(var.default_map["vlans"].suffix)               >= 1                ? (
        "${each.value.prefix[0]}-${each.value.prefix[1]}-${each.value.tags.freeform.label}-${var.default_map["vlans"].suffix[0]}"
    ) : (
      length(each.value.prefix)                             == 0                && 
      length(each.value.suffix)                             == 0                && 
      length(var.default_map["vlans"].prefix)               == 1                &&
      length(var.default_map["vlans"].suffix)               == 0                ? (
        "${var.default_map["vlans"].prefix[0]}-${each.value.tags.freeform.label}"
    ) : (
      length(each.value.prefix)                             == 0                && 
      length(each.value.suffix)                             == 0                && 
      length(var.default_map["vlans"].prefix)               >= 2                &&
      length(var.default_map["vlans"].suffix)               == 0                ? (
        "${var.default_map["vlans"].prefix[0]}-${var.default_map["vlans"].prefix[1]}-${each.value.tags.freeform.label}-${each.value.suffix[0]}"
    ) : (
                                                                                                    #names with default prefix and vnc suffix
      length(each.value.prefix)                             == 0                && 
      length(each.value.suffix)                             >= 1                && 
      length(var.default_map["vlans"].prefix)               == 1                &&
      length(var.default_map["vlans"].suffix)               == 0                ? (
        "${var.default_map["vlans"].prefix[0]}-${each.value.tags.freeform.label}-${each.value.suffix[0]}"
    ) : (
      length(each.value.prefix)                             == 0                && 
      length(each.value.suffix)                             >= 1                && 
      length(var.default_map["vlans"].prefix)               >= 2                &&
      length(var.default_map["vlans"].suffix)               == 0                ? (
        "${var.default_map["vlans"].prefix[0]}-${var.default_map["vlans"].prefix[1]}-${each.value.tags.freeform.label}-${each.value.suffix[0]}"
    ) : (
                                                                                                    #names with default prefix and default suffix
      length(each.value.prefix)                             == 0                && 
      length(each.value.suffix)                             == 0                && 
      length(var.default_map["vlans"].prefix)               == 1                &&
      length(var.default_map["vlans"].suffix)               >= 1                ? (
        "${var.default_map["vlans"].prefix[0]}-${each.value.tags.freeform.label}-${var.default_map["vlans"].suffix[0]}"
    ) : (
      length(each.value.prefix)                             == 0                && 
      length(each.value.suffix)                             == 0                && 
      length(var.default_map["vlans"].prefix)               >= 2                &&
      length(var.default_map["vlans"].suffix)               >= 1                ? (
        "${var.default_map["vlans"].prefix[0]}-${var.default_map["vlans"].prefix[1]}-${each.value.tags.freeform.label}-${var.default_map["vlans"].suffix[0]}"
    ) : (
                                                                                                    #names with default prefix
      length(each.value.prefix)                             == 0                && 
      length(each.value.suffix)                             == 0                && 
      length(var.default_map["vlans"].prefix)               == 1                &&
      length(var.default_map["vlans"].suffix)               >= 1                ? (
        "${var.default_map["vlans"].prefix[0]}-${var.default_map["vlans"].prefix[1]}-${each.value.tags.freeform.label}-${var.default_map["vlans"].suffix[0]}"
    ) : (

      length(each.value.prefix)                             == 0                && 
      length(each.value.suffix)                             == 0                && 
      length(var.default_map["vlans"].prefix)               >= 2                &&
      length(var.default_map["vlans"].suffix)               >= 0                ? (
        "${var.default_map["vlans"].prefix[0]}-${var.default_map["vlans"].prefix[1]}-${each.value.tags.freeform.label}-${var.default_map["vlans"].suffix[0]}"
    ) : (

                                                                                                    #names with default suffix
      length(each.value.prefix)                             == 0                && 
      length(each.value.suffix)                             == 0                && 
      length(var.default_map["vlans"].prefix)               == 0                &&
      length(var.default_map["vlans"].suffix)               >= 1                ? (
        "${each.value.tags.freeform.label}-${var.default_map["vlans"].suffix[0]}"
    ) : (
                                                                                                    #yup you screwed up!
        "you should not see this"
  )))))))))))))))))

    freeform_tags                   = each.value.tags.freeform
    #nsg_ids                         = 
    #route_table_id                  =
    vcn_id                          = var.vcn_map[each.value.vcn].id
    vlan_tag                        = each.value.vlan_tag
}