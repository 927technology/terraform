output "map" {
  value =  ({
    for label, setting in data.oci_identity_users.list.users : 
      lookup(setting.freeform_tags, label, setting.name) => setting
  })
}