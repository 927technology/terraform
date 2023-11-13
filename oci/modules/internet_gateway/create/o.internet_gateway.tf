output "internet_gateway-map" {
    depends_on                      = [
                                        oci_core_internet_gateway.v0_1_0
    ]
    value                           = oci_core_internet_gateway.v0_1_0
}

output "internet_gateway-list" {
    depends_on                      = [
                                        oci_core_internet_gateway.v0_1_0
    ]
    value                           = oci_core_internet_gateway.v0_1_0
}

output "internet_gateway-raw" {
    depends_on                      = [
                                        oci_core_internet_gateway.v0_1_0
    ]
    value                           = oci_core_internet_gateway.v0_1_0
}