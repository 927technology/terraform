output  "list" {
  description                       = ""
  sensitive                         = false
  value                             = data.oci_identity_compartments.list.compartments
}

output  "map" {
  description                       = ""
  sensitive                         = false
  value                             = ({
    for label, setting in data.oci_identity_compartments.list.compartments : (
      setting.name == "ManagedCompartmentForPaaS" 
        ? 
          setting.name
        : 
          setting.freeform_tags.label
      )  => setting
  })
}