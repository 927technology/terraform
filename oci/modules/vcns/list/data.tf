/*
data "oci_core_vcns" "list"         {
    compartment_id =   (
      var.compartment        == "root"                           ? (
        var.tenancy_map.id
      ) : (
        var.compartment_map[each.value.compartment].id
    ))  

    #Optional
    #display_name = var.vcn_display_name
    #state = var.vcn_state
}
*/

data "oci_core_vcns" "list"         {
    for_each                        = merge({
        for label, setting in var.compartment_map :
            label => setting
    })


    compartment_id =   var.compartment_map[each.key].id


    #Optional
    #display_name = var.vcn_display_name
    #state = var.vcn_state
}