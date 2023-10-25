/*
data "oci_identity_fault_domains" "ad1" {
  availability_domain             = var.availability_domains.0.name
  compartment_id                  = var.tenancy_map.id
}
data "oci_identity_fault_domains" "ad2" {
  availability_domain             = var.availability_domains.1.name
  compartment_id                  = var.tenancy_map.id
}
data "oci_identity_fault_domains" "ad3" {
  availability_domain             = var.availability_domains.2.name
  compartment_id                  = var.tenancy_map.id
}
*/

data "oci_identity_fault_domains" "list" {
  availability_domain             = each.value
  compartment_id                  = var.tenancy_map.id
  for_each                        = toset(var.availabilitydomains)
}



