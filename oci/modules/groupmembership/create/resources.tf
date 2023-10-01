/*
resource "oci_identity_user_group_membership" "v0_1_0" {
  #count                           = length(local.role)


  for_each                        = {
    for index, setting in local.role : setting.id => setting
      if  ( var.et_map.users[setting.user].enable             == true     &&
            var.et_map.groups[setting.group].enable           == true     &&
            var.et_map.modules["groupmembership"].enable      == true     &&
            var.et_map.modules["groups"].enable               == true     && 
            var.et_map.modules["users"].enable                == true     &&                            #is the et module version 0.1.0 OR
            var.default_map.modules["groups"].enable          == true     &&                            #is the default module enabled
            var.default_map.modules["groupmembership"].enable == true     &&
            var.default_map.modules["users"].enable           == true     &&                            #is the default module enabled

            ( ( var.et_map.modules["groups"].version          == "0.1.0"  &&
                var.et_map.modules["users"].version           == "0.1.0"
              )                                                           ||
              ( var.default_map.modules["groups"].version     == "0.1.0"  &&
                var.default_map.modules["users"].version      == "0.1.0"
              )
            )
          )
  }



  for_each                        = {
    for user, setting in var.et_map.users : user => [
      for membership in setting.groups : {
        for acl in membership : {
        user                      = user
        group                     = group
        }
      }
    ]
  }

  #group_id                        = var.groups_map[each.value[index].group].id
  group_id                        = var.groups_map[membership[index].group].id
  user_id                         = var.users_map[each.key].id

  #group_id                        = var.groups_list-all[local.role[count.index].group].id
  #user_id                         = var.users_list-all[local.role[count.index].user].id

}

*/