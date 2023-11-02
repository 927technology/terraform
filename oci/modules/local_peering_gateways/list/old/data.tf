data "oci_core_local_peering_gateways" "list" {
    for_each                        = ({
        for label, setting in var.compartment_map :
            label => setting
    })

    compartment_id                  = var.compartment_map[each.key].id
    #vcn_id                          = 
}