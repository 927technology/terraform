output "local_peering_gateways-map" {
    value                           = ({
      for label, settings in data.oci_core_local_peering_gateways.list : 
        label => settings
          if length(settings.local_peering_gateways) > 0 
  })
}

output "local_peering_gateways-list" {
  depends_on                        = []
  value                             = ([
    for label, settings in data.oci_core_local_peering_gateways.list : {
      "compartment_id"              = settings.compartment_id
      "id"                          = settings.id 
      "local_peering_gateways"      = settings.local_peering_gateways
      "name"                        = label
    }
  ])
}