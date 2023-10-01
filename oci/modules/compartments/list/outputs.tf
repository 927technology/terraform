output after {
  value                           = null                         
}
output  "all" {
  description                     = ""
  sensitive                       = false
  value                           = data.oci_identity_compartments.list.compartments
}
