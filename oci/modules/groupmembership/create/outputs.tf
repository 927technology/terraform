output after {
  value                           = null                         
}
output "locals" {
  value                           = local.role
}

# output "users-all" {
#   value =({
#     #for_each                        = {
#       for index, setting in local.role : setting.user => setting
#     #}
#   })
#   #value=var.users_list-all
# }