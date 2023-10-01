output  "ad1" {
  description                     = ""
  sensitive                       = false
  value                           = data.oci_identity_fault_domains.ad1.fault_domains
}
output  "ad2" {
  description                     = ""
  sensitive                       = false
  value                           = data.oci_identity_fault_domains.ad2.fault_domains
}
output  "ad3" {
  description                     = ""
  sensitive                       = false
  value                           = data.oci_identity_fault_domains.ad3.fault_domains
}