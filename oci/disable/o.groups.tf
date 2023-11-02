/*
output "groups_initial-map"          {
  depends_on                        = [ 
                                        module.groups_initial-data 
  ]
  value                             = module.groups_initial-data.map
}
*/

output "groups-map"                  {
  depends_on                        = [ 
                                        module.groups-data 
  ]
  value                             = module.groups-data.map
}