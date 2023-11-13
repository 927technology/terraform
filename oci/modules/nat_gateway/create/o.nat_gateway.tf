output "nat_gateway-map"            {
    depends_on                      = [
                                        oci_core_nat_gateway.v0_1_0
    ]
    value                           = oci_core_nat_gateway.v0_1_0
}

output "nat_gateway-list"           {
    depends_on                      = [
                                        oci_core_nat_gateway.v0_1_0
    ]
    value                           = oci_core_nat_gateway.v0_1_0
}

output "nat_gateway-raw"            {
    depends_on                      = [
                                        oci_core_nat_gateway.v0_1_0
    ]
    value                           = oci_core_nat_gateway.v0_1_0
}