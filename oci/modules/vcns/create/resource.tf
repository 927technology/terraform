resource "oci_core_vcn" "v0_1_0" {
    for_each                        = ({
      for setting in var.et_map.vcns :
        setting.label => setting


      if  ( 
        var.et_map.modules["compartments"].enable           == true             &&                  #compartments must be enabled
        var.default_map.modules["compartments"].enable      == true             &&                  #compartments must be enabled
        var.default_map.modules["vcns"].enable              == true             &&                  #vcns must be enabled
        setting.enable                                      == true             &&                  #is the et module enabled
        ( var.default_map.modules["vcns"].version           == "0.1.0"          ||                  #is the et module version 0.1.0 OR
          ( var.default_map.modules["vcns"].version         == null             &&                  #is the et module version null AND
            var.default_map.modules["vcns"].version         == "0.1.0"                              #is the default module version 0.1.0
          )
        )
      )
    }) 

    compartment_id                  =  var.compartment_map[each.value.compartment].id
   
    /*                                                                                              #future
    byoipv6cidr_details {
        byoipv6range_id = oci_core_byoipv6range.test_byoipv6range.id
        ipv6cidr_block = var.vcn_byoipv6cidr_details_ipv6cidr_block
    }
    */

    #cidr_block                      = each.value.cidr_block                                        #depricated
    cidr_blocks                     = each.value.cidr_blocks
    defined_tags                    = each.value.defined_tags
    display_name                    = ( 
                                                                                                    #names with no prefix or suffix
      length(each.value.prefix)                             == 0                && 
      length(each.value.suffix)                             == 0                && 
      length(var.default_map["vcns"].prefix)                == 0                && 
      length(var.default_map["vcns"].suffix)                == 0                ? ( 
        each.value.name
    ) : (
                                                                                                    #names with vcn prefix and no suffix
      length(each.value.prefix)                             == 1                &&
      length(each.value.suffix)                             == 0                &&
      length(var.default_map["vcns"].suffix)                == 0                ? ( 
        "${each.value.prefix[0]}-${each.value.name}"
    ) : (
      length(each.value.prefix)                             >= 2                &&
      length(each.value.suffix)                             == 0                &&
      length(var.default_map["vcns"].suffix)                == 0                ? ( 
        "${each.value.prefix[0]}-${each.value.prefix[1]}-${each.value.name}"
    ) : (
                                                                                                    #names with vcn prefix and suffix
      length(each.value.prefix)                             == 1                &&
      length(each.value.suffix)                             >= 1                ? (
        "${each.value.prefix[0]}-${each.value.name}-${each.value.suffix[0]}"
    ) : (
      length(each.value.prefix)                             >= 2                &&
      length(each.value.suffix)                             >= 1                ? (
        "${each.value.prefix[0]}-${each.value.prefix[1]}-${each.value.name}-${each.value.suffix[0]}"
    ) : (
                                                                                                    #names with vcn prefix and default suffix
      length(each.value.prefix)                             == 1                &&
      length(each.value.suffix)                             == 0                &&
      length(var.default_map["vcns"].suffix)                >= 1                ? (
        "${each.value.prefix[0]}-${each.value.name}-${var.default_map["vcns"].suffix[0]}"
    ) : (
      length(each.value.prefix)                             >= 2                &&
      length(each.value.suffix)                             == 0                &&
      length(var.default_map["vcns"].suffix)                >= 1                ? (
        "${each.value.prefix[0]}-${each.value.prefix[1]}-${each.value.name}-${var.default_map["vcns"].suffix[0]}"
    ) : (
      length(each.value.prefix)                             == 0                && 
      length(each.value.suffix)                             == 0                && 
      length(var.default_map["vcns"].prefix)                == 1                &&
      length(var.default_map["vcns"].suffix)                == 0                ? (
        "${var.default_map["vcns"].prefix[0]}-${each.value.name}"
    ) : (
      length(each.value.prefix)                             == 0                && 
      length(each.value.suffix)                             == 0                && 
      length(var.default_map["vcns"].prefix)                >= 2                &&
      length(var.default_map["vcns"].suffix)                == 0                ? (
        "${var.default_map["vcns"].prefix[0]}-${var.default_map["vcns"].prefix[1]}-${each.value.name}-${each.value.suffix[0]}"
    ) : (
                                                                                                    #names with default prefix and vnc suffix
      length(each.value.prefix)                             == 0                && 
      length(each.value.suffix)                             >= 1                && 
      length(var.default_map["vcns"].prefix)                == 1                &&
      length(var.default_map["vcns"].suffix)                == 0                ? (
        "${var.default_map["vcns"].prefix[0]}-${each.value.name}-${each.value.suffix[0]}"
    ) : (
      length(each.value.prefix)                             == 0                && 
      length(each.value.suffix)                             >= 1                && 
      length(var.default_map["vcns"].prefix)                >= 2                &&
      length(var.default_map["vcns"].suffix)                == 0                ? (
        "${var.default_map["vcns"].prefix[0]}-${var.default_map["vcns"].prefix[1]}-${each.value.name}-${each.value.suffix[0]}"
    ) : (
                                                                                                    #names with default prefix and default suffix
      length(each.value.prefix)                             == 0                && 
      length(each.value.suffix)                             == 0                && 
      length(var.default_map["vcns"].prefix)                == 1                &&
      length(var.default_map["vcns"].suffix)                >= 1                ? (
        "${var.default_map["vcns"].prefix[0]}-${each.value.name}-${var.default_map["vcns"].suffix[0]}"
    ) : (
      length(each.value.prefix)                             == 0                && 
      length(each.value.suffix)                             == 0                && 
      length(var.default_map["vcns"].prefix)                >= 2                &&
      length(var.default_map["vcns"].suffix)                >= 1                ? (
        "${var.default_map["vcns"].prefix[0]}-${var.default_map["vcns"].prefix[1]}-${each.value.name}-${var.default_map["vcns"].suffix[0]}"
    ) : (
                                                                                                    #names with default prefix
      length(each.value.prefix)                             == 0                && 
      length(each.value.suffix)                             == 0                && 
      length(var.default_map["vcns"].prefix)                == 1                &&
      length(var.default_map["vcns"].suffix)                >= 1                ? (
        "${var.default_map["vcns"].prefix[0]}-${var.default_map["vcns"].prefix[1]}-${each.value.name}-${var.default_map["vcns"].suffix[0]}"
    ) : (

      length(each.value.prefix)                             == 0                && 
      length(each.value.suffix)                             == 0                && 
      length(var.default_map["vcns"].prefix)                >= 2                &&
      length(var.default_map["vcns"].suffix)                >= 0                ? (
        "${var.default_map["vcns"].prefix[0]}-${var.default_map["vcns"].prefix[1]}-${each.value.name}-${var.default_map["vcns"].suffix[0]}"
    ) : (

                                                                                                    #names with default suffix
      length(each.value.prefix)                             == 0                && 
      length(each.value.suffix)                             == 0                && 
      length(var.default_map["vcns"].prefix)                == 0                &&
      length(var.default_map["vcns"].suffix)                >= 1                ? (
        "${each.value.name}-${var.default_map["vcns"].suffix[0]}"
    ) : (
                                                                                                    #yup you screwed up!
        "you should not see this"
    )))))))))))))))))

    dns_label                       = each.value.dns_label
    freeform_tags                   = { 
      "tf"                          = true
      "label"                       = each.value.label
      "timestamp"                   = timestamp()
    }

    ipv6private_cidr_blocks         = each.value.ipv6private_cidr_blocks
    #is_ipv6enabled                  = each.value.is_ipv6enabled
    #is_oracle_gua_allocation_enabled = each.value.is_oracle_gua_allocation_enabled
}