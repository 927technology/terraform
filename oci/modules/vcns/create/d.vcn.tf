/*
data "oci_core_vcns" "list"         {
  for_each                          = ({
    for setting in var.et_map.compartments :
      setting.label => setting
      if setting.enable == true
  })

  compartment_id                    = var.compartments_map[each.value.label].id
  #display_name                      = null
  #state                             = null
  depends_on                        = [
                                        oci_core_vcn.v0_1_0 #,
                                        #oci_core_local_peering_gateway.v0_1_0-d0
  ]

  filter {
    name                            = "freeform_tags.tf"
    values                          = [
                                        true
    ]
  }
}
*/