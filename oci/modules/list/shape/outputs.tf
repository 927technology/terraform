output "count" {
  description         = ""
  sensitive           = false
  value               = length(data.oci_core_shapes.test_shapes)
}

output "object" {
    description       = ""
    sensitive         = false
    value             = data.oci_core_shapes.test_shapes
}