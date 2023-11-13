output "subnets-map"                {
  value                             = oci_core_subnet.v0_1_0
}

output "subnets-list"               {
  depends_on                        = []
  value                             = oci_core_subnet.v0_1_0 
}

output "subnets-raw"                {
    depends_on                      = []
    value                           = oci_core_subnet.v0_1_0
}