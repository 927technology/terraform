output "drg-list"                  {
  description                       = "display a list of drg"
  sensitive                         = false
  value                             = oci_core_drg.v0_1_0
}

output  "drg-map"                  {
  description                       = "display a map object of drg"
  sensitive                         = false
  value                             = oci_core_drg.v0_1_0
}

output  "drg-raw"                  {
  description                       = "display the raw output of drg"
  sensitive                         = false
  value                             = oci_core_drg.v0_1_0
}