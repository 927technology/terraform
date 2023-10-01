output after {
  value                           = null                         
}
output  "all" {
  description         = ""
  #value               = data.oci_identity_users.list.users
  
  value               = ({
    for label, setting in data.oci_identity_users.list.users : setting.name => setting
  })
  
  
  sensitive           = false
}