output "map" {
  value                             = ({
    for label, setting in data.oci_identity_groups.list.groups :
      lookup(setting.freeform_tags, label, setting.name) => setting
  })
}