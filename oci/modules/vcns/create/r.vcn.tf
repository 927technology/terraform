resource "oci_core_vcn" "v0_1_0" {
  for_each                          = ({
    for settings in var.et_map.vcns :
      settings.label => settings

    if  ( 
      # test compartment availability
      ( try(
          var.et_map.compartments[
            index(
              var.et_map.compartments.*.label, settings.compartment
            )
          ].enable , false 
        ) 
      )                                                               == true             &&        #et compartment exists is enabled
      
      # all other tests
      settings.enable                                                 == true             &&        #et vcns must be enabled
  
      var.default_map.modules["compartments"].enable                  == true             &&        #et compartments must be enabled
      var.default_map.modules["vcns"].enable                          == true             &&        #default vcns must be enabled
  
      var.et_map.modules["compartments"].enable                       == true             &&        #default compartments must be enabled
  
      ( var.default_map.modules["vcns"].version                       == "0.1.0"          ||        #default module version 0.1.0 OR
        ( var.default_map.modules["vcns"].version                     == null             &&        #default module version null AND
          var.et_map.modules["vcns"].version                          == "0.1.0"                    #et module version 0.1.0
        )
      )
    )
  }) 

  compartment_id                    =  var.compartments_map[each.value.compartment].id
  
  /*                                                                                                #future
  byoipv6cidr_details {
      byoipv6range_id               = null
      ipv6cidr_block                = null
  }
  */

  #cidr_block                        = null                                                         #depricated
  cidr_blocks                       = each.value.cidr_blocks
  defined_tags                      = each.value.defined_tags
  display_name                      = ( 
                                                                                                    #names with no prefix or suffix
    length(each.value.prefix)                                         == 0                && 
    length(each.value.suffix)                                         == 0                && 
    length(var.default_map["vcns"].prefix)                            == 0                && 
    length(var.default_map["vcns"].suffix)                            == 0                ? ( 
      each.value.name
  ) : (
                                                                                                    #names with vcn prefix and no suffix
    length(each.value.prefix)                                         == 1                &&
    length(each.value.suffix)                                         == 0                &&
    length(var.default_map["vcns"].suffix)                            == 0                ? ( 
      "${each.value.prefix[0]}-${each.value.name}"
  ) : (
    length(each.value.prefix)                                         >= 2                &&
    length(each.value.suffix)                                         == 0                &&
    length(var.default_map["vcns"].suffix)                            == 0                ? ( 
      "${each.value.prefix[0]}-${each.value.prefix[1]}-${each.value.name}"
  ) : (
                                                                                                    #names with vcn prefix and suffix
    length(each.value.prefix)                                         == 1                &&
    length(each.value.suffix)                                         >= 1                ? (
      "${each.value.prefix[0]}-${each.value.name}-${each.value.suffix[0]}"
  ) : (
    length(each.value.prefix)                                         >= 2                &&
    length(each.value.suffix)                                         >= 1                ? (
      "${each.value.prefix[0]}-${each.value.prefix[1]}-${each.value.name}-${each.value.suffix[0]}"
  ) : (
                                                                                                    #names with vcn prefix and default suffix
    length(each.value.prefix)                                         == 1                &&
    length(each.value.suffix)                                         == 0                &&
    length(var.default_map["vcns"].suffix)                            >= 1                ? (
      "${each.value.prefix[0]}-${each.value.name}-${var.default_map["vcns"].suffix[0]}"
  ) : (
    length(each.value.prefix)                                         >= 2                &&
    length(each.value.suffix)                                         == 0                &&
    length(var.default_map["vcns"].suffix)                            >= 1                ? (
      "${each.value.prefix[0]}-${each.value.prefix[1]}-${each.value.name}-${var.default_map["vcns"].suffix[0]}"
  ) : (
    length(each.value.prefix)                                         == 0                && 
    length(each.value.suffix)                                         == 0                && 
    length(var.default_map["vcns"].prefix)                            == 1                &&
    length(var.default_map["vcns"].suffix)                            == 0                ? (
      "${var.default_map["vcns"].prefix[0]}-${each.value.name}"
  ) : (
    length(each.value.prefix)                                         == 0                && 
    length(each.value.suffix)                                         == 0                && 
    length(var.default_map["vcns"].prefix)                            >= 2                &&
    length(var.default_map["vcns"].suffix)                            == 0                ? (
      "${var.default_map["vcns"].prefix[0]}-${var.default_map["vcns"].prefix[1]}-${each.value.name}-${each.value.suffix[0]}"
  ) : (
                                                                                                    #names with default prefix and vnc suffix
    length(each.value.prefix)                                         == 0                && 
    length(each.value.suffix)                                         >= 1                && 
    length(var.default_map["vcns"].prefix)                            == 1                &&
    length(var.default_map["vcns"].suffix)                            == 0                ? (
      "${var.default_map["vcns"].prefix[0]}-${each.value.name}-${each.value.suffix[0]}"
  ) : (
    length(each.value.prefix)                                         == 0                && 
    length(each.value.suffix)                                         >= 1                && 
    length(var.default_map["vcns"].prefix)                            >= 2                &&
    length(var.default_map["vcns"].suffix)                            == 0                ? (
      "${var.default_map["vcns"].prefix[0]}-${var.default_map["vcns"].prefix[1]}-${each.value.name}-${each.value.suffix[0]}"
  ) : (
                                                                                                    #names with default prefix and default suffix
    length(each.value.prefix)                                         == 0                && 
    length(each.value.suffix)                                         == 0                && 
    length(var.default_map["vcns"].prefix)                            == 1                &&
    length(var.default_map["vcns"].suffix)                            >= 1                ? (
      "${var.default_map["vcns"].prefix[0]}-${each.value.name}-${var.default_map["vcns"].suffix[0]}"
  ) : (
    length(each.value.prefix)                                         == 0                && 
    length(each.value.suffix)                                         == 0                && 
    length(var.default_map["vcns"].prefix)                            >= 2                &&
    length(var.default_map["vcns"].suffix)                            >= 1                ? (
      "${var.default_map["vcns"].prefix[0]}-${var.default_map["vcns"].prefix[1]}-${each.value.name}-${var.default_map["vcns"].suffix[0]}"
  ) : (
                                                                                                    #names with default prefix
    length(each.value.prefix)                                         == 0                && 
    length(each.value.suffix)                                         == 0                && 
    length(var.default_map["vcns"].prefix)                            == 1                &&
    length(var.default_map["vcns"].suffix)                            >= 1                ? (
      "${var.default_map["vcns"].prefix[0]}-${var.default_map["vcns"].prefix[1]}-${each.value.name}-${var.default_map["vcns"].suffix[0]}"
  ) : (

    length(each.value.prefix)                                         == 0                && 
    length(each.value.suffix)                                         == 0                && 
    length(var.default_map["vcns"].prefix)                            >= 2                &&
    length(var.default_map["vcns"].suffix)                            >= 0                ? (
      "${var.default_map["vcns"].prefix[0]}-${var.default_map["vcns"].prefix[1]}-${each.value.name}-${var.default_map["vcns"].suffix[0]}"
  ) : (

                                                                                                    #names with default suffix
    length(each.value.prefix)                                         == 0                && 
    length(each.value.suffix)                                         == 0                && 
    length(var.default_map["vcns"].prefix)                            == 0                &&
    length(var.default_map["vcns"].suffix)                            >= 1                ? (
      "${each.value.name}-${var.default_map["vcns"].suffix[0]}"
  ) : (
                                                                                                    #yup you screwed up!
      "you should not see this"
  )))))))))))))))))

  dns_label                         = each.value.dns_label
  freeform_tags                     = { 
    "tf"                            = true
    "label"                         = each.value.label
    "timestamp"                     = timestamp()
  }

  ipv6private_cidr_blocks           = each.value.ipv6private_cidr_blocks
  #is_ipv6enabled                    = null
  #is_oracle_gua_allocation_enabled  = null
}