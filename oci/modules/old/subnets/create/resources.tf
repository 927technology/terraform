resource "oci_core_subnet" "v0_1_0" {
  for_each                        = ({
    for setting in var.et_map.subnets :
      setting.label => setting

    if  ( 
      var.et_map.modules["compartments"].enable                       == true       &&
      var.et_map.modules["subnets"].enable                            == true       &&
      var.et_map.modules["vcns"].enable                               == true       &&
      var.default_map.modules["compartments"].enable                  == true       &&
      var.default_map.modules["subnets"].enable                       == true       &&
      var.default_map.modules["vcns"].enable                          == true       &&
      setting.enable                                                  == true       &&              #is the et module enabled
      ( var.default_map.modules["subnets"].version   == "0.1.0"                     ||              #is the et module version 0.1.0 OR
        ( var.default_map.modules["subnets"].version == null                        &&              #is the et module version null AND
          var.default_map.modules["subnets"].version == "0.1.0"                                     #is the default module version 0.1.0
        )
      )
    )
  }) 

  #availability_domain               = null
  cidr_block                        = "${each.value.cidr.subnet}/${each.value.cidr.prefix}"

  compartment_id                    = var.compartments_map[each.value.compartment].id

  defined_tags                      = each.value.tags.defined

  #dhcp_options_id                   = null
  
  display_name                    = ( 
                                                                                                   #names with no prefix or suffix
      length(each.value.prefix)                                       == 0          && 
      length(each.value.suffix)                                       == 0          && 
      length(var.default_map["subnets"].prefix)                       == 0          && 
      length(var.default_map["subnets"].suffix)                       == 0          ? ( 
        each.value.name
    ) : (
                                                                                                    #names with vcn prefix and no suffix
      length(each.value.prefix)                                       == 1          &&
      length(each.value.suffix)                                       == 0          &&
      length(var.default_map["subnets"].suffix)                       == 0          ? ( 
        "${each.value.prefix[0]}-${each.value.name}"
    ) : (
      length(each.value.prefix)                                       >= 2          &&
      length(each.value.suffix)                                       == 0          &&
      length(var.default_map["subnets"].suffix)                       == 0          ? ( 
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
      length(var.default_map["subnets"].suffix)                       >= 1          ? (
        "${each.value.prefix[0]}-${each.value.name}-${var.default_map["subnets"].suffix[0]}"
    ) : (
      length(each.value.prefix)                                       >= 2          &&
      length(each.value.suffix)                                       == 0          &&
      length(var.default_map["subnets"].suffix)                       >= 1          ? (
        "${each.value.prefix[0]}-${each.value.prefix[1]}-${each.value.name}-${var.default_map["subnets"].suffix[0]}"
    ) : (
      length(each.value.prefix)                                       == 0          && 
      length(each.value.suffix)                                       == 0          && 
      length(var.default_map["subnets"].prefix)                       == 1          &&
      length(var.default_map["subnets"].suffix)                       == 0          ? (
        "${var.default_map["subnets"].prefix[0]}-${each.value.name}"
    ) : (
      length(each.value.prefix)                                       == 0          && 
      length(each.value.suffix)                                       == 0          && 
      length(var.default_map["subnets"].prefix)                       >= 2          &&
      length(var.default_map["subnets"].suffix)                       == 0          ? (
        "${var.default_map["subnets"].prefix[0]}-${var.default_map["subnets"].prefix[1]}-${each.value.name}-${each.value.suffix[0]}"
    ) : (
                                                                                                    #names with default prefix and vnc suffix
      length(each.value.prefix)                                       == 0          && 
      length(each.value.suffix)                                       >= 1          && 
      length(var.default_map["subnets"].prefix)                       == 1          &&
      length(var.default_map["subnets"].suffix)                       == 0          ? (
        "${var.default_map["subnets"].prefix[0]}-${each.value.name}-${each.value.suffix[0]}"
    ) : (
      length(each.value.prefix)                                       == 0          && 
      length(each.value.suffix)                                       >= 1          && 
      length(var.default_map["subnets"].prefix)                       >= 2          &&
      length(var.default_map["subnets"].suffix)                       == 0          ? (
        "${var.default_map["subnets"].prefix[0]}-${var.default_map["subnets"].prefix[1]}-${each.value.name}-${each.value.suffix[0]}"
    ) : (
                                                                                                    #names with default prefix and default suffix
      length(each.value.prefix)                                       == 0          && 
      length(each.value.suffix)                                       == 0          && 
      length(var.default_map["subnets"].prefix)                       == 1          &&
      length(var.default_map["subnets"].suffix)                       >= 1          ? (
        "${var.default_map["subnets"].prefix[0]}-${each.value.name}-${var.default_map["subnets"].suffix[0]}"
    ) : (
      length(each.value.prefix)                                       == 0          && 
      length(each.value.suffix)                                       == 0          && 
      length(var.default_map["subnets"].prefix)                       >= 2          &&
      length(var.default_map["subnets"].suffix)                       >= 1          ? (
        "${var.default_map["subnets"].prefix[0]}-${var.default_map["subnets"].prefix[1]}-${each.value.name}-${var.default_map["subnets"].suffix[0]}"
    ) : (
                                                                                                    #names with default prefix
      length(each.value.prefix)                                       == 0          && 
      length(each.value.suffix)                                       == 0          && 
      length(var.default_map["subnets"].prefix)                       == 1          &&
      length(var.default_map["subnets"].suffix)                       >= 1          ? (
        "${var.default_map["subnets"].prefix[0]}-${var.default_map["subnets"].prefix[1]}-${each.value.name}-${var.default_map["subnets"].suffix[0]}"
    ) : (

      length(each.value.prefix)                                       == 0          && 
      length(each.value.suffix)                                       == 0          && 
      length(var.default_map["subnets"].prefix)                       >= 2          &&
      length(var.default_map["subnets"].suffix)                       >= 0          ? (
        "${var.default_map["subnets"].prefix[0]}-${var.default_map["subnets"].prefix[1]}-${each.value.name}-${var.default_map["subnets"].suffix[0]}"
    ) : (

                                                                                                    #names with default suffix
      length(each.value.prefix)                                       == 0          && 
      length(each.value.suffix)                                       == 0          && 
      length(var.default_map["subnets"].prefix)                       == 0          &&
      length(var.default_map["subnets"].suffix)                       >= 1          ? (
        "${each.value.name}-${var.default_map["subnets"].suffix[0]}"
    ) : (
                                                                                                    #yup you screwed up!
        "you should not see this"
  )))))))))))))))))
  
  #dns_label                         = null

  freeform_tags                     = { 
    "label"                         = each.value.label
    "tf"                            = true
    "timestamp"                     = timestamp()
  }

  #ipv6cidr_block                    = null
  #ipv6cidr_blocks                   = null
  #prohibit_internet_ingress         = null
  #prohibit_public_ip_on_vnic        = null
  #route_table_id                    = null
  #security_list_ids                 = null

  vcn_id = (
    var.vcns_map[each.value.vcn.compartment].virtual_networks[
      index(
        var.vcns_map[each.value.vcn.compartment].virtual_networks.*.freeform_tags.label, each.value.vcn.label
      )
    ].id
  )
}