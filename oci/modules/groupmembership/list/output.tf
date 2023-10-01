output after {
  value                           = null                         
}
output groups                     {
  description                     = ""
  value                           = data.oci_identity_user_group_memberships.groups
}