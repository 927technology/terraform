data "oci_core_instances" "test_instance" {
  compartment_id      = var.instance_compartment_id
}