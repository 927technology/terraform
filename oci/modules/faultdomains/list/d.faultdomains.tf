data "oci_identity_fault_domains" "list" {
  availability_domain               = each.value
  compartment_id                    = var.tenancy_map.id
  for_each                          = toset(var.availabilitydomains)
}



