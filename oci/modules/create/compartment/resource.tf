resource "oci_identity_compartment" "compartment" {
  
  compartment-app_list  = {
    for et, configuration in var.compatment-instance_map[var.compartment-et] : et => configuration

    if configuration.enable == true
  }

  for_each              = {
    for app, setting in var.compartment-app_list : app => setting
  }
  
  compartment_id        = var.compartment-region_map[var.compartment-et_map[var.compartment-et].region].id
  description           = "${each.setting.display_name} Resource for ${var.compartment-et_map[var.compartment-et].prefix}-${var.compartment-et_map[var.compartment-et].suffix}"
  name                  = "${var.compartment-et_map[var.compartment-et].prefix}-${var.compartment-et_map[var.compartment-et].suffix}-cmp"
#  name                  = "${var.compartment-et_map[var.compartment-et].prefix}-${var.compartment-et_map[var.compartment-et].suffix}-${each.setting.name}-cmp"
  compute               = each.setting.compute

}



  # provisioner "local-exec" {
  #   command               = "sleep ${var.compartment-et_map[each.et.name].sleep}"
  # }