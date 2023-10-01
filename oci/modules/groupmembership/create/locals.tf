/*
locals {
  role=flatten([
    for user in keys(var.et_map.users)               : [
      for group in var.et_map.users[user].groups     : {
        #id                        = "${var.et_map.users[user].id}_${var.et_map.groups[group].id}"
        user                      = user
        group                     = group
      }
    ]
  ])
}
*/

locals {
  role=({
    for user, setting in var.et_map.users              : user => [
      for group in var.et_map.users[user].groups     : {
        #id                        = "${var.et_map.users[user].id}_${var.et_map.groups[group].id}"
        user                      = user
        group                     = group
      }
    ]
  })
}