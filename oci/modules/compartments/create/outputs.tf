output  "list"                      {
  description                       = "display a list of existing compartments at d5/final cycle.  this includes all levels already known in the infrastructure."
  sensitive                         = false
  value                             = (concat(
    data.oci_identity_compartments.list.compartments,
    [
      {
        "compartment_id"            = var.tenancy_map.id
        "defined_tags"              = var.tenancy_map.tags.defined
        "description"               = var.tenancy_map.description
        "enable_delete"             = var.tenancy_map.enable_delete
        "freeform_tags"             = var.tenancy_map.tags.freeform
        "id"                        = var.tenancy_map.id
        "inactive_state"            = var.tenancy_map.inactive_state
        "is_accessible"             = var.tenancy_map.is_accessible
        "name"                      = var.tenancy_map.name
        "state"                     = var.tenancy_map.state
        "time_created"              = var.tenancy_map.time_created
      }
    ]
  ))
}

output  "map"                       {
  description                       = "display a map of existing compartments at d5/final cycle.  this includes all levels already known in the infrastructure."
  sensitive                         = false
  value                             = (merge(
    {
      for label, setting in data.oci_identity_compartments.list.compartments : 
        setting.freeform_tags.label => setting
    },
    {
      "root" = {
        "compartment_id"            = var.tenancy_map.id
        "defined_tags"              = var.tenancy_map.tags.defined
        "description"               = var.tenancy_map.description
        "enable_delete"             = var.tenancy_map.enable_delete
        "freeform_tags"             = var.tenancy_map.tags.freeform
        "id"                        = var.tenancy_map.id
        "inactive_state"            = var.tenancy_map.inactive_state
        "is_accessible"             = var.tenancy_map.is_accessible
        "name"                      = var.tenancy_map.name
        "state"                     = var.tenancy_map.state
        "time_created"              = var.tenancy_map.time_created
      }
    }
  ))
}

output "raw" {
  value                             = data.oci_identity_compartments.list.compartments
}

output "test"                       {
  value                             = null
}