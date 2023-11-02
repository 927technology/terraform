data "oci_identity_compartments"    "list"      {
  access_level                    = var.access_level
  compartment_id                  = var.tenancy_map.id
  compartment_id_in_subtree       = true
  depends_on                      = [
                                        data.oci_identity_compartments.list-d0,
                                        data.oci_identity_compartments.list-d1,
                                        data.oci_identity_compartments.list-d2,
                                        data.oci_identity_compartments.list-d3,
                                        data.oci_identity_compartments.list-d4,
                                        oci_identity_compartment.v0_1_1-d1,
                                        oci_identity_compartment.v0_1_1-d2,
                                        oci_identity_compartment.v0_1_1-d3,
                                        oci_identity_compartment.v0_1_1-d4,
                                        oci_identity_compartment.v0_1_1-d5
  ]
  name                            = var.name
  state                           = var.state

  filter {
    name                          = "freeform_tags.tf"
    values                        = [
                                      true
    ]
  }
}