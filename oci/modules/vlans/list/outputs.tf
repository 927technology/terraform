output "map" {
    value = data.oci_core_vlans.list
}

output "list"          {
  depends_on                        = []
  value                             = ([
    for label, setting in data.oci_core_vlans.list : {
      "name"                        = label
      "compartment_id"              = setting.compartment_id
      "id" = setting.id 
      #"virtual_networks" = setting.virtual_networks
    }
  ])
}