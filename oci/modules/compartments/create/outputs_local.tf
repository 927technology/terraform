output list-d0 {
  description                       = "display a map of existing compartments at d0 cycle.  this includes all levels already known in the infrastructure."
  value = data.oci_identity_compartments.list-d0.compartments
}

output list-d1 {
  description                       = "display a map of existing compartments at d1 cycle.  this includes all levels already known in the infrastructure."
  value = data.oci_identity_compartments.list-d1.compartments
}

output list-d2 {
  description                       = "display a map of existing compartments at d2 cycle.  this includes all levels already known in the infrastructure."
  value = data.oci_identity_compartments.list-d2.compartments
}

output list-d3 {
  description                       = "display a map of existing compartments at d3 cycle.  this includes all levels already known in the infrastructure."
  value = data.oci_identity_compartments.list-d3.compartments
}

output list-d4 {
  description                       = "display a map of existing compartments at d4 cycle.  this includes all levels already known in the infrastructure."
  value = data.oci_identity_compartments.list-d4.compartments
}