data "oci_core_vcns" "list"         {
  for_each                          = ({
    for setting in var.et_map.compartments :
      setting.label => setting
  })

  compartment_id                    = var.compartment_map[each.value.label].id
  #display_name                      = null
  #state                             = null

  filter {
    name                            = "freeform_tags.tf"
    values                          = [
                                        true
    ]
  }
}


/*
data "oci_core_vcns" "list"         {
    for_each                        = ({
        for label, setting in var.compartment_map :
            label => setting
    })

    compartment_id =   var.compartment_map[each.key].id
    #display_name = var.vcn_display_name
    #state = var.vcn_state
}
*/

/*
data "oci_core_vcns" "list"         {
  compartment_id =   "ocid1.compartment.oc1..aaaaaaaak4q5vaed6x4vzpyi2uiqf6hqbwxq7otewkrnaktbpjgekivrl3ia"
  #display_name = var.vcn_display_name
  #state = var.vcn_state
} 
*/