data "oci_core_local_peering_gateways" "list" {
  for_each                        = ({
    for label, setting in var.et_map.compartments :
      setting.label => setting
  })

  compartment_id                  = var.compartment_map[each.key].id
  depends_on                      = [
                                      oci_core_local_peering_gateway.v0_1_0
  ]
  #vcn_id                          = null

  /*  
  filter {
    name                            = "freeform_tags.tf"
    values                          = [
                                        true
    ]
  }
  */
}

data "oci_core_local_peering_gateways" "pre" {
  for_each                        = ({
    for label, setting in var.et_map.compartments :
      setting.label => setting
  })

  compartment_id                  = var.compartment_map[each.key].id
  depends_on                      = []
  #vcn_id                          = null

    
  filter {
    name                            = "freeform_tags.tf"
    values                          = [
                                        true
    ]
  }
}