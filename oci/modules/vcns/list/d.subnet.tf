data "oci_core_subnets" "list"      {
  for_each                          = ({
    for label, setting in var.et_map.compartments :
      setting.label => setting
      if setting.enable == true
  })

  compartment_id                    = var.compartments_map[each.key].id
  depends_on                        = []
  #display_name                      = null
  #state                             = var.state
  #vcn_id                            = null

  filter {
    name                            = "freeform_tags.tf"
    values                          = [
                                        true
    ]
  }
}