output "count" {
  description         = ""
  sensitive           = false
  value               = length(data.oci_core_images.test_images)
}

output "object" {
    description       = ""
    sensitive         = false
    value             = data.oci_core_images.test_images
}

output "operating_system" {
  description         = ""
  sensitive           = false
  value               = data.oci_core_images.test_images.operating_system
}

output "search" {
  description         = ""
  sensitive           = false
  value               = [
    for image in data.oci_core_images.test_images.images : image
    if var.image_filter !=null && ( image.operating_system == var.image_filter || image.operating_system_version == var.image_filter )
  ]
}