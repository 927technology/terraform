data "oci_core_local_peering_gateways" "list" {
  for_each                        = ({
    for label, setting in var.et_map.compartments :
      setting.label => setting
  })

  compartment_id                  = var.compartment_map[each.key].id
  depends_on                      = []
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