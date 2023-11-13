output "vcns-list"                  {
  description                       = "display a list of vcns"
  sensitive                         = false
  value                             = oci_core_vcn.v0_1_0
}

output  "vcns-map"                  {
  description                       = "display a map object of vcns"
  sensitive                         = false
  value                             = oci_core_vcn.v0_1_0
}

output  "vcns-raw"                  {
  description                       = "display the raw output of vcns"
  sensitive                         = false
  value                             = oci_core_vcn.v0_1_0
}