data "oci_identity_availability_domains" "list" {
    compartment_id                = var.tenancy_map.id
}