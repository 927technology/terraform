output "list" {
  description                       = "display a list of vcns"
  sensitive                         = false
  value                             = ([
    for label, settings in data.oci_core_vcns.list : 
      {
        "label"                     = label,
        "compartment_id"            = settings.compartment_id,
        "virtual_networks"          = settings.virtual_networks
      }
  ])
}

output  "map" {
  description                       = "display a map object of vcns"
  sensitive                         = false
  value                             = ({
    for label, settings in data.oci_core_vcns.list : label => {
      "compartment_id"              = settings.compartment_id
      "virtual_networks"            = settings.virtual_networks
    }
  })
}

output  "raw" {
  description                       = "display the raw output of vcns"
  sensitive                         = false
  value                             = data.oci_core_vcns.list
}

/*
output "test" {
  description                        = "used for testing outputs"
  value = ([
    for label, settings in data.oci_core_vcns.list : 
      {
        "label"                     = label,
        "compartment_id"            = settings.compartment_id,
        "virtual_networks"          = settings.virtual_networks
      }
  ])
}
*/