data "oci_core_shapes" "test_shapes" {
  compartment_id      = var.shape_compartment_id
}