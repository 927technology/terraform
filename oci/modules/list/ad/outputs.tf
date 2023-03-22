output "count" {
  description         = ""
  sensitive           = false
  value               = length(data.oci_identity_availability_domains.ads.availability_domains)
}

output "name" {
    description       = ""
    sensitive         = false
    value             = data.oci_identity_availability_domains.ads.availability_domains[*].name
}

output "compartment_id" {
    description       = ""
    sensitive         = false
    value             = data.oci_identity_availability_domains.ads.availability_domains[*].compartment_id
}

output "id" {
    description       = ""
    sensitive         = false
    value             = data.oci_identity_availability_domains.ads.availability_domains[*].id
}