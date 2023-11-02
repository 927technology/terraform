resource "oci_core_local_peering_gateway" "v0_1_0" {
    for_each                        = ({
      for setting in var.et_map.local_peering_gateways :
        setting.label => setting

      /*
      if  ( 
        var.et_map.modules["compartments"].enable                     == true       &&
        var.et_map.modules["local_peering_gateways"].enable           == true       &&
        var.et_map.modules["vcns"].enable                             == true       &&
        var.default_map.modules["compartments"].enable                == true       &&
        var.default_map.modules["local_peering_gateways"].enable      == true       &&
        var.default_map.modules["vcns"].enable                        == true       &&
        setting.enable                                                == true       &&              #is the et module enabled
        ( var.default_map.modules["local_peering_gateways"].version   == "0.1.0"    ||              #is the et module version 0.1.0 OR
          ( var.default_map.modules["local_peering_gateways"].version == null       &&              #is the et module version null AND
            var.default_map.modules["local_peering_gateways"].version == "0.1.0"                    #is the default module version 0.1.0
          )
        )
      )
      */
    }) 

    compartment_id                  = var.compartment_map[each.value.compartment].id

    defined_tags                    = each.value.tags.defined
    depends_on                      = [
                                        data.oci_core_local_peering_gateways.pre

    ]
    display_name                    = ( 
                                                                                                   #names with no prefix or suffix
      length(each.value.prefix)                                       == 0          && 
      length(each.value.suffix)                                       == 0          && 
      length(var.default_map["local_peering_gateways"].prefix)        == 0          && 
      length(var.default_map["local_peering_gateways"].suffix)        == 0          ? ( 
        each.value.name
    ) : (
                                                                                                    #names with vcn prefix and no suffix
      length(each.value.prefix)                                       == 1          &&
      length(each.value.suffix)                                       == 0          &&
      length(var.default_map["local_peering_gateways"].suffix)        == 0          ? ( 
        "${each.value.prefix[0]}-${each.value.name}"
    ) : (
      length(each.value.prefix)                                       >= 2          &&
      length(each.value.suffix)                                       == 0          &&
      length(var.default_map["local_peering_gateways"].suffix)        == 0          ? ( 
        "${each.value.prefix[0]}-${each.value.prefix[1]}-${each.value.name}"
    ) : (
                                                                                                    #names with vcn prefix and suffix
      length(each.value.prefix)                                       == 1          &&
      length(each.value.suffix)                                       >= 1          ? (
        "${each.value.prefix[0]}-${each.value.name}-${each.value.suffix[0]}"
    ) : (
      length(each.value.prefix)                                       >= 2          &&
      length(each.value.suffix)                                       >= 1          ? (
        "${each.value.prefix[0]}-${each.value.prefix[1]}-${each.value.name}-${each.value.suffix[0]}"
    ) : (
                                                                                                    #names with vcn prefix and default suffix
      length(each.value.prefix)                                       == 1          &&
      length(each.value.suffix)                                       == 0          &&
      length(var.default_map["local_peering_gateways"].suffix)        >= 1          ? (
        "${each.value.prefix[0]}-${each.value.name}-${var.default_map["local_peering_gateways"].suffix[0]}"
    ) : (
      length(each.value.prefix)                                       >= 2          &&
      length(each.value.suffix)                                       == 0          &&
      length(var.default_map["local_peering_gateways"].suffix)        >= 1          ? (
        "${each.value.prefix[0]}-${each.value.prefix[1]}-${each.value.name}-${var.default_map["local_peering_gateways"].suffix[0]}"
    ) : (
      length(each.value.prefix)                                       == 0          && 
      length(each.value.suffix)                                       == 0          && 
      length(var.default_map["local_peering_gateways"].prefix)        == 1          &&
      length(var.default_map["local_peering_gateways"].suffix)        == 0          ? (
        "${var.default_map["local_peering_gateways"].prefix[0]}-${each.value.name}"
    ) : (
      length(each.value.prefix)                                       == 0          && 
      length(each.value.suffix)                                       == 0          && 
      length(var.default_map["local_peering_gateways"].prefix)        >= 2          &&
      length(var.default_map["local_peering_gateways"].suffix)        == 0          ? (
        "${var.default_map["local_peering_gateways"].prefix[0]}-${var.default_map["local_peering_gateways"].prefix[1]}-${each.value.name}-${each.value.suffix[0]}"
    ) : (
                                                                                                    #names with default prefix and vnc suffix
      length(each.value.prefix)                                       == 0          && 
      length(each.value.suffix)                                       >= 1          && 
      length(var.default_map["local_peering_gateways"].prefix)        == 1          &&
      length(var.default_map["local_peering_gateways"].suffix)        == 0          ? (
        "${var.default_map["local_peering_gateways"].prefix[0]}-${each.value.name}-${each.value.suffix[0]}"
    ) : (
      length(each.value.prefix)                                       == 0          && 
      length(each.value.suffix)                                       >= 1          && 
      length(var.default_map["local_peering_gateways"].prefix)        >= 2          &&
      length(var.default_map["local_peering_gateways"].suffix)        == 0          ? (
        "${var.default_map["local_peering_gateways"].prefix[0]}-${var.default_map["local_peering_gateways"].prefix[1]}-${each.value.name}-${each.value.suffix[0]}"
    ) : (
                                                                                                    #names with default prefix and default suffix
      length(each.value.prefix)                                       == 0          && 
      length(each.value.suffix)                                       == 0          && 
      length(var.default_map["local_peering_gateways"].prefix)        == 1          &&
      length(var.default_map["local_peering_gateways"].suffix)        >= 1          ? (
        "${var.default_map["local_peering_gateways"].prefix[0]}-${each.value.name}-${var.default_map["local_peering_gateways"].suffix[0]}"
    ) : (
      length(each.value.prefix)                                       == 0          && 
      length(each.value.suffix)                                       == 0          && 
      length(var.default_map["local_peering_gateways"].prefix)        >= 2          &&
      length(var.default_map["local_peering_gateways"].suffix)        >= 1          ? (
        "${var.default_map["local_peering_gateways"].prefix[0]}-${var.default_map["local_peering_gateways"].prefix[1]}-${each.value.name}-${var.default_map["local_peering_gateways"].suffix[0]}"
    ) : (
                                                                                                    #names with default prefix
      length(each.value.prefix)                                       == 0          && 
      length(each.value.suffix)                                       == 0          && 
      length(var.default_map["local_peering_gateways"].prefix)        == 1          &&
      length(var.default_map["local_peering_gateways"].suffix)        >= 1          ? (
        "${var.default_map["local_peering_gateways"].prefix[0]}-${var.default_map["local_peering_gateways"].prefix[1]}-${each.value.name}-${var.default_map["local_peering_gateways"].suffix[0]}"
    ) : (

      length(each.value.prefix)                                       == 0          && 
      length(each.value.suffix)                                       == 0          && 
      length(var.default_map["local_peering_gateways"].prefix)        >= 2          &&
      length(var.default_map["local_peering_gateways"].suffix)        >= 0          ? (
        "${var.default_map["local_peering_gateways"].prefix[0]}-${var.default_map["local_peering_gateways"].prefix[1]}-${each.value.name}-${var.default_map["local_peering_gateways"].suffix[0]}"
    ) : (

                                                                                                    #names with default suffix
      length(each.value.prefix)                                       == 0          && 
      length(each.value.suffix)                                       == 0          && 
      length(var.default_map["local_peering_gateways"].prefix)        == 0          &&
      length(var.default_map["local_peering_gateways"].suffix)        >= 1          ? (
        "${each.value.name}-${var.default_map["local_peering_gateways"].suffix[0]}"
    ) : (
                                                                                                    #yup you screwed up!
        "you should not see this"
    )))))))))))))))))
    freeform_tags                   = { 
      "tf"                          = true
      "label"                       = each.value.label
      #"status"                      = try(data.oci_core_local_peering_gateways.pre[each.value.freeform_tags.status, false) ? true : false
      "timestamp"                   = timestamp()
    }

    #peer_id                         = var.local_peering_gateways[each.value.peer].id
    #route_table_id                  = var.local_peering_gateways[each.value.route_table].id
    vcn_id = null
/*
    vcn_id                          = (
      var.vcn_map[
        each.value.vcn.compartment
      ].virtual_networks[
        index(var.vcn_map.*.freeform_tags.label, each.value.vcn.name)
      ].id
    )
*/
}