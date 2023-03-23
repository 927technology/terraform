resource "oci_core_vcn" "vcn" {
  
  for_each              = { 
    for vcn, setting in var.vcn-instance_map : vcn => setting

    if setting.enable == true
  }
  
  compartment_id        = var.vcn-region_map[var.vcn-et_map[var.vcn-et].region].id
  byoipv6cidr_details {
    byoipv6range_id     = each.value.vcn.byoipv6range_id
    ipv6cidr_block      = each.value.vcn.ipv6cidr_block
  }
  cidr_block            = each.value.vcn.cidr_block
  cidr_blocks           = each.value.vcn.cidr_blocks
  #defined_tags          = each.value.vcn.defined_tags                                              #enabling this will overwrite OCI auto create tags
  display_name          = var.vcn-et_map[var.vcn-et].prefix != null && var.vcn-et_map[var.vcn-et].suffix != null ? "${var.vcn-et_map[var.vcn-et].prefix}-${var.vcn-et_map[var.vcn-et].suffix}-${each.value.name}-vcn" : ( var.vcn-et_map[var.vcn-et].prefix == null ?  "${var.vcn-et_map[var.vcn-et].suffix}-${each.value.name}-vcn" : ( var.vcn-et_map[var.vcn-et].suffix == null ? "${var.vcn-et_map[var.vcn-et].prefix}-${each.value.name}-vcn" : "you shouldnt see this" ))
  dns_label             = each.value.vcn.dns_label
  freeform_tags         = each.value.vcn.freeform_tags
  ipv6private_cidr_blocks = each.value.vcn.ipv6private_cidr_blocks
  is_ipv6enabled        = each.value.vcn.is_ipv6enabled
  is_oracle_gua_allocation_enabled = each.value.vcn.is_oracle_gua_allocation_enabled
}