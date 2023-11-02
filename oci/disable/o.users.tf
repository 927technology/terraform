/*
output "users_initial-map"          {
  depends_on                        = [ 
                                        module.users_initial-data 
  ]
  value                             = module.users_initial-data.map
}
*/

output "users-map"                  {
  depends_on                        = [ 
                                        module.users-data 
  ]
  value                             = module.users-data.map
}