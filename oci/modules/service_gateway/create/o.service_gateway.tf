output "service_gateway-map"        {
    depends_on                      = [
                                        oci_core_service_gateway.v0_1_0
    ]
    value                           = oci_core_service_gateway.v0_1_0
}

output "service_gateway-list"       {
    depends_on                      = [
                                        oci_core_service_gateway.v0_1_0
    ]
    value                           = oci_core_service_gateway.v0_1_0
}

output "service_gateway-raw"        {
    depends_on                      = [
                                        oci_core_service_gateway.v0_1_0
    ]
    value                           = oci_core_service_gateway.v0_1_0
}