output "services-map"               {
  depends_on                        = [
                                        data.oci_core_services.v0_1_0
  ]
  value                             = data.oci_core_services.v0_1_0
}

output "services-list"              {
  depends_on                        = [
                                        data.oci_core_services.v0_1_0
  ]
  value                             = data.oci_core_services.v0_1_0
}

output "services-raw"               {
  depends_on                        = [
                                        data.oci_core_services.v0_1_0
  ]
  value                             = data.oci_core_services.v0_1_0
}