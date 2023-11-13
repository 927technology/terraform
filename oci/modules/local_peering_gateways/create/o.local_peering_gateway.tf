output "local_peering_gateways-map" {
    depends_on                      = []
    value                           = (
      merge(
        oci_core_local_peering_gateway.v0_1_0-d0,
        oci_core_local_peering_gateway.v0_1_0-d1
    ))
}

output "local_peering_gateways-list" {
    depends_on                      = []
    value                           = ([
      for label, settings in (
      merge(
        oci_core_local_peering_gateway.v0_1_0-d0,
        oci_core_local_peering_gateway.v0_1_0-d1
      )) :
       settings
    ])
}

output "local_peering_gateways-raw" {
    depends_on                      = []
    value                           = (
      merge(
        oci_core_local_peering_gateway.v0_1_0-d0,
        oci_core_local_peering_gateway.v0_1_0-d1
    ))
}