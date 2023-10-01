output after {
  value                           = null                         
}
output  "all" {
  description         = ""
  #value               = data.oci_identity_groups.list.groups
  value               = ({
    for label, setting in data.oci_identity_groups.list.groups : setting.name => setting
  })
  sensitive           = false
}