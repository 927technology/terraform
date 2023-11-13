output "map"                        {
    value                           = ({
      for label, setting in data.oci_core_local_peering_gateways.list : label => setting
        if length(setting.local_peering_gateways) > 0 
  })
}

output "list"                       {
  depends_on                        = []
  value                             = ([
    for label, setting in data.oci_core_local_peering_gateways.list : {
      "compartment_id"              = setting.compartment_id
      "id"                          = setting.id 
      "local_peering_gateways"      = setting.local_peering_gateways
      "name"                        = label
    }
  ])
}

output "raw"                        {
    depends_on                      = []
    value                           = data.oci_core_local_peering_gateways.list
}

output "test"                       {
  depends_on                        = []
  value                             = null
}