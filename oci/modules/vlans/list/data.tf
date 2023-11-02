data "oci_core_vlans" "list" {
    for_each                        = ({
      for label, setting in var.compartment_map :
        label => setting
    })
    
    compartment_id = var.compartment_map[each.key].id
    #display_name = var.vlan_display_name
    #state = var.state
    #vcn_id = oci_core_vcn.test_vcn.id
}