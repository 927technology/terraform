data "oci_core_images" "test_images" {
  compartment_id      = var.image_compartment_id

  # filter {
  #   name              = "images.operating_system"
  #   values            = var.image_filter
  # }
}