data "oci_core_shapes" "list"       {
  availability_domain               = each.value
  compartment_id                    = var.id
  for_each                          = toset(var.availabilitydomains)
  #image_id                          = null
}
