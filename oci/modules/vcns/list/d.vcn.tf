data "oci_core_vcns" "list"         {
  for_each                          = ({
    for setting in var.et_map.compartments :
      setting.label => setting
      if setting.enable == true
  })

  compartment_id                    = var.compartments_map[each.value.label].id
  #display_name                      = null
  #state                             = null
  depends_on                        = []

  filter {
    name                            = "freeform_tags.tf"
    values                          = [
                                        true
    ]
  }
}