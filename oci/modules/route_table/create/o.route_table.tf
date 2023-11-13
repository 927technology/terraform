output "route_table-map"            {
    depends_on                      = [
                                        oci_core_route_table.v0_1_0
    ]
    value                           = oci_core_route_table.v0_1_0
}

output "route_table-list"           {
    depends_on                      = [
                                        oci_core_route_table.v0_1_0
    ]
    value                           = oci_core_route_table.v0_1_0
}

output "route_table-raw"            {
    depends_on                      = [
                                        oci_core_route_table.v0_1_0
    ]
    value                           = oci_core_route_table.v0_1_0
}