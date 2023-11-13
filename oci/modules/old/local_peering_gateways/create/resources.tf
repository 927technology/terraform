data "oci_core_vcns" "v0_1_0-d0" {
  #compartment_id                    = var.compartments_map["shared-network"].id
  compartment_id                    = "ocid1.compartment.oc1..aaaaaaaasa4wy2ifqgcdzol3snj64cx5tnhj5uojl6lyeefk424ayj5a6o4a"
  depends_on                        = []
  #display_name                      = null
  #state                             = null
}




resource "oci_core_local_peering_gateway" "v0_1_0-d0" {
    for_each                        = ({
      for setting in var.et_map.local_peering_gateways :
        setting.label => setting

      if  ( 
        var.et_map.modules["compartments"].enable                     == true       &&
        var.et_map.modules["local_peering_gateways"].enable           == true       &&
        var.et_map.modules["vcns"].enable                             == true       &&
        var.default_map.modules["compartments"].enable                == true       &&
        var.default_map.modules["local_peering_gateways"].enable      == true       &&
        var.default_map.modules["vcns"].enable                        == true       &&
        setting.enable                                                == true       &&              #is the et module enabled
        setting.vcn.peer.primary                                      == false      &&
        ( var.default_map.modules["local_peering_gateways"].version   == "0.1.0"    ||              #is the et module version 0.1.0 OR
          ( var.default_map.modules["local_peering_gateways"].version == null       &&              #is the et module version null AND
            var.default_map.modules["local_peering_gateways"].version == "0.1.0"                    #is the default module version 0.1.0
          )
        )
      )
    }) 

    #compartment_id                  = var.compartments_map[each.value.compartment].id
    compartment_id = "ocid1.compartment.oc1..aaaaaaaasa4wy2ifqgcdzol3snj64cx5tnhj5uojl6lyeefk424ayj5a6o4a"
    defined_tags                    = each.value.tags.defined
    depends_on                      = [
                                        data.oci_core_vcns.v0_1_0-d0
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
    "label"                       = each.value.label
    "lpg_primary"                 = each.value.vcn.peer.primary
    "lpg_peer"                    = "${each.value.vcn.peer.compartment}/${each.value.vcn.peer.label}"
    "tf"                          = true
    "timestamp"                   = timestamp()
  }
  
  #peer_id                         = null                                                           #unused on non-primary peerings

  vcn_id = "ocid1.vcn.oc1.iad.amaaaaaaffki3maaftxgbakgletcefxktxkyaeaosmyw2rn4ph2wwdyyjd6a"
  /*
  vcn_id = (
    data.oci_core_vcns.v0_1_0-d0.virtual_networks[
      index(
        data.oci_core_vcns.v0_1_0-d0.virtual_networks.*.freeform_tags.label, each.value.vcn.label
      )
    ].id
  )
  */
  /*
  # using data lookup for vcn - forces replacement
  vcn_id                            = (
    var.et_map.vcns[
        index(
          var.et_map.vcns.*.label, each.value.vcn.label
        )
      ].id != null
    ? (
      var.et_map.vcns[
        index(
          var.et_map.vcns.*.label, each.value.vcn.label
        )
      ].id
    )
    : (
      var.vcns_map[each.value.vcn.compartment].virtual_networks[
        index(
          var.vcns_map[each.value.vcn.compartment].virtual_networks.*.freeform_tags.label, each.value.vcn.label
        )
      ].id
    )
  )
  */
}


/*
data "oci_core_local_peering_gateways" "v0_1_0-d1" {
  for_each                        = ({
    for setting in var.et_map.compartments :
      setting.label => setting
      if setting.enable == true
  })

  compartment_id                    = var.compartments_map[each.value.label].id
  depends_on                        = [
                                        oci_core_local_peering_gateway.v0_1_0-d0
  ]
  #vcn_id                            = null

  filter {
    name                            = "freeform_tags.tf"
    values                          = [
                                        true
    ]
  }
}
*/




data "oci_core_vcns" "v0_1_0-d1" {
  compartment_id                    = var.compartments_map["shared-network"].id
  #compartment_id                    = "ocid1.compartment.oc1..aaaaaaaasa4wy2ifqgcdzol3snj64cx5tnhj5uojl6lyeefk424ayj5a6o4a"

  depends_on                        = [
                                        data.oci_core_vcns.v0_1_0-d0,
                                        oci_core_local_peering_gateway.v0_1_0-d0
  ]

    #Optional
    #display_name = var.vcn_display_name
    #state = var.vcn_state
}


resource "oci_core_local_peering_gateway" "v0_1_0-d1" {
    for_each                        = ({
      for setting in var.et_map.local_peering_gateways :
        setting.label => setting

      if  ( 
        var.et_map.modules["compartments"].enable                     == true       &&
        var.et_map.modules["local_peering_gateways"].enable           == true       &&
        var.et_map.modules["vcns"].enable                             == true       &&
        var.default_map.modules["compartments"].enable                == true       &&
        var.default_map.modules["local_peering_gateways"].enable      == true       &&
        var.default_map.modules["vcns"].enable                        == true       &&
        setting.enable                                                == true       &&              #is the et module enabled
        setting.vcn.peer.primary                                      == true       &&
        ( var.default_map.modules["local_peering_gateways"].version   == "0.1.0"    ||              #is the et module version 0.1.0 OR
          ( var.default_map.modules["local_peering_gateways"].version == null       &&              #is the et module version null AND
            var.default_map.modules["local_peering_gateways"].version == "0.1.0"                    #is the default module version 0.1.0
          )
        )
      )
    }) 

    #compartment_id = "ocid1.compartment.oc1..aaaaaaaasa4wy2ifqgcdzol3snj64cx5tnhj5uojl6lyeefk424ayj5a6o4a"
    compartment_id                  = var.compartments_map[each.value.compartment].id
    defined_tags                    = each.value.tags.defined
    depends_on                      = [
                                        data.oci_core_vcns.v0_1_0-d1,
                                        oci_core_local_peering_gateway.v0_1_0-d0
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
    "label"                       = each.value.label
    "lpg_primary"                 = each.value.vcn.peer.primary
    "lpg_peer"                    = "${each.value.vcn.peer.compartment}/${each.value.vcn.peer.label}"
    "tf"                          = true
    "timestamp"                   = timestamp()
  }
  /*
  peer_id                         = (
    data.oci_core_local_peering_gateways.v0_1_0-d1["shared-network"].local_peering_gateways[
      index(
        data.oci_core_local_peering_gateways.v0_1_0-d1["shared-network"].local_peering_gateways.*.freeform_tags.label, each.value.vcn.peer.label
      )
    ].id
  )
  */
  #route_table_id                  = var.local_peering_gateways[each.value.route_table].id
  
  vcn_id = "ocid1.vcn.oc1.iad.amaaaaaaffki3maabrofnzz73fpza2rpun3ureqhqt6yzc2ybs7c73weujha"

 
  
}