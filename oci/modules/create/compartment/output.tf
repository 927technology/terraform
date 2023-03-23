output "id" {
  description           = ""
  sensitive             = false
  value                 = {
    for_each            = {
      for app, setting in oci_identity_compartment.compartment[*] : app => setting
    }
  }
}