data "oci_core_vcns" "list"         {
    for_each                        = ({
        for label, setting in var.compartment_map :
            label => setting
    })

    compartment_id =   var.compartment_map[each.key].id
    #display_name = var.vcn_display_name
    #state = var.vcn_state
}