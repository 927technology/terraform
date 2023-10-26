output "map" {
    value = data.oci_core_vcns.list
}

output "list"          {
  depends_on                        = []
  value                             = ([
    for label, setting in data.oci_core_vcns.list : {
      "name"                        = label
      "compartment_id"              = setting.compartment_id
      "id" = setting.id 
      "virtual_networks" = setting.virtual_networks
    }
  ])
}