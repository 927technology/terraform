output "vcns-list"                  {
  description                       = "display a list of vcns"
  sensitive                         = false
  value                             = ([
    for label, settings in data.oci_core_vcns.list : 
      {
        "label"                     = label,
        "compartment_id"            = settings.compartment_id,
        "virtual_networks"          = settings.virtual_networks
      }
      if length(settings.virtual_networks) > 0
  ])
}

output  "vcns-map"                  {
  description                       = "display a map object of vcns"
  sensitive                         = false
  value                             = ({
    for settings in (
      flatten([
        for label-l1, settings-l1 in data.oci_core_vcns.list : 
          settings-l1.virtual_networks
          if length(settings-l1.virtual_networks) > 0
      ])
    ) : settings.freeform_tags.label => settings
  })
}