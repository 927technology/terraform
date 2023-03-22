output "count" {
  description         = ""
  sensitive           = false
  value               = length(data.oci_identity_compartment.compartments)
}

output "object" {
    description       = ""
    sensitive         = false
    value             = data.oci_identity_compartment.compartments
}