data "oci_identity_compartments"    "list"      {
  access_level                    = var.access_level
  compartment_id                  = var.tenancy_map.id
  compartment_id_in_subtree       = true
  depends_on                      = []
  name                            = var.name
  state                           = var.state

  filter {
    name                          = "freeform_tags.tf"
    values                        = [
                                      true
    ]
  }
}