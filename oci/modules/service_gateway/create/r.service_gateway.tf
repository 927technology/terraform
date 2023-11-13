resource "oci_core_service_gateway" "v0_1_0" {
  for_each                          = ({
    for settings in var.et_map.service_gateway :
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
      
      # test vcn availability
      ( try(
          var.et_map.vcns[
            index(
              var.et_map.vcns.*.label, settings.vcn.label
            )
          ].enable , false 
        ) 
      )                                                               == true             &&        #et vcn exists is enabled          

      # all other tests
      settings.enable                                                 == true             &&        #is the et module enabled
      
      var.default_map.modules["compartments"].enable                  == true             &&        #default compartments module enabled
      var.default_map.modules["service_gateway"].enable               == true             &&        #default service_gateway module enabled
      var.default_map.modules["vcns"].enable                          == true             &&        #default vcns module enabled

      var.et_map.modules["compartments"].enable                       == true             &&        #et compartments module enabled
      var.et_map.modules["service_gateway"].enable                    == true             &&        #et service_gateway module enabled
      var.et_map.modules["vcns"].enable                               == true             &&        #et vcns module enabled
    
      ( var.default_map.modules["service_gateway"].version            == "0.1.0"          ||        #is the et module version 0.1.0 OR
        ( var.default_map.modules["service_gateway"].version          == null             &&        #is the et module version null AND
          var.et_map.modules["service_gateway"].version               == "0.1.0"                    #is the default module version 0.1.0
        )
      )
    )
  }) 

  compartment_id                    = var.compartments_map[each.value.compartment].id
  #defined_tags                      = each.value.tags.defined
  depends_on                        = []
  display_name                      = ( 
                                                                                                  #names with no prefix or suffix
    length(each.value.prefix)                                         == 0                && 
    length(each.value.suffix)                                         == 0                && 
    length(var.default_map["service_gateway"].prefix)                 == 0                && 
    length(var.default_map["service_gateway"].suffix)                 == 0                ? ( 
      each.value.name
  ) : (
                                                                                                  #names with vcn prefix and no suffix
    length(each.value.prefix)                                         == 1                &&
    length(each.value.suffix)                                         == 0                &&
    length(var.default_map["service_gateway"].suffix)                 == 0                ? ( 
      "${each.value.prefix[0]}-${each.value.name}"
  ) : (
    length(each.value.prefix)                                         >= 2                &&
    length(each.value.suffix)                                         == 0                &&
    length(var.default_map["service_gateway"].suffix)                 == 0                ? ( 
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
    length(var.default_map["service_gateway"].suffix)                 >= 1                ? (
      "${each.value.prefix[0]}-${each.value.name}-${var.default_map["service_gateway"].suffix[0]}"
  ) : (
    length(each.value.prefix)                                         >= 2                &&
    length(each.value.suffix)                                         == 0                &&
    length(var.default_map["service_gateway"].suffix)                 >= 1                ? (
      "${each.value.prefix[0]}-${each.value.prefix[1]}-${each.value.name}-${var.default_map["service_gateway"].suffix[0]}"
  ) : (
    length(each.value.prefix)                                         == 0                && 
    length(each.value.suffix)                                         == 0                && 
    length(var.default_map["service_gateway"].prefix)                 == 1                &&
    length(var.default_map["service_gateway"].suffix)                 == 0                ? (
      "${var.default_map["service_gateway"].prefix[0]}-${each.value.name}"
  ) : (
    length(each.value.prefix)                                         == 0                && 
    length(each.value.suffix)                                         == 0                && 
    length(var.default_map["service_gateway"].prefix)                 >= 2                &&
    length(var.default_map["service_gateway"].suffix)                 == 0                ? (
      "${var.default_map["service_gateway"].prefix[0]}-${var.default_map["service_gateway"].prefix[1]}-${each.value.name}-${each.value.suffix[0]}"
  ) : (
                                                                                                  #names with default prefix and vnc suffix
    length(each.value.prefix)                                         == 0                && 
    length(each.value.suffix)                                         >= 1                && 
    length(var.default_map["service_gateway"].prefix)                 == 1                &&
    length(var.default_map["service_gateway"].suffix)                 == 0                ? (
      "${var.default_map["service_gateway"].prefix[0]}-${each.value.name}-${each.value.suffix[0]}"
  ) : (
    length(each.value.prefix)                                         == 0                && 
    length(each.value.suffix)                                         >= 1                && 
    length(var.default_map["service_gateway"].prefix)                 >= 2                &&
    length(var.default_map["service_gateway"].suffix)                 == 0                ? (
      "${var.default_map["service_gateway"].prefix[0]}-${var.default_map["service_gateway"].prefix[1]}-${each.value.name}-${each.value.suffix[0]}"
  ) : (
                                                                                                  #names with default prefix and default suffix
    length(each.value.prefix)                                         == 0                && 
    length(each.value.suffix)                                         == 0                && 
    length(var.default_map["service_gateway"].prefix)                 == 1                &&
    length(var.default_map["service_gateway"].suffix)                 >= 1                ? (
      "${var.default_map["service_gateway"].prefix[0]}-${each.value.name}-${var.default_map["service_gateway"].suffix[0]}"
  ) : (
    length(each.value.prefix)                                         == 0                && 
    length(each.value.suffix)                                         == 0                && 
    length(var.default_map["service_gateway"].prefix)                 >= 2                &&
    length(var.default_map["service_gateway"].suffix)                 >= 1                ? (
      "${var.default_map["service_gateway"].prefix[0]}-${var.default_map["service_gateway"].prefix[1]}-${each.value.name}-${var.default_map["service_gateway"].suffix[0]}"
  ) : (
                                                                                                  #names with default prefix
    length(each.value.prefix)                                         == 0                && 
    length(each.value.suffix)                                         == 0                && 
    length(var.default_map["service_gateway"].prefix)                 == 1                &&
    length(var.default_map["service_gateway"].suffix)                 >= 1                ? (
      "${var.default_map["service_gateway"].prefix[0]}-${var.default_map["service_gateway"].prefix[1]}-${each.value.name}-${var.default_map["service_gateway"].suffix[0]}"
  ) : (

    length(each.value.prefix)                                         == 0                && 
    length(each.value.suffix)                                         == 0                && 
    length(var.default_map["service_gateway"].prefix)                 >= 2                &&
    length(var.default_map["service_gateway"].suffix)                 >= 0                ? (
      "${var.default_map["service_gateway"].prefix[0]}-${var.default_map["service_gateway"].prefix[1]}-${each.value.name}-${var.default_map["service_gateway"].suffix[0]}"
  ) : (

                                                                                                  #names with default suffix
    length(each.value.prefix)                                         == 0                && 
    length(each.value.suffix)                                         == 0                && 
    length(var.default_map["service_gateway"].prefix)                 == 0                &&
    length(var.default_map["service_gateway"].suffix)                 >= 1                ? (
      "${each.value.name}-${var.default_map["service_gateway"].suffix[0]}"
  ) : (
                                                                                                  #yup you screwed up!
    "you should not see this"
  )))))))))))))))))
    
  freeform_tags                     = { 
    "label"                         = each.value.label
    "tf"                            = true
    "timestamp"                     = timestamp()
    "vcn_label"                     = each.value.vcn.label
  }
  
  route_table_id                    = (
    try(
      var.route_table_map[each.value.route_table.label].id, null
    )
  )

  
  services {
    service_id                      = each.value.service.labels
  }

  vcn_id                            = var.vcns_map[each.value.vcn.label].id
}