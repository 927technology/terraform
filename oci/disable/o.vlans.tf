/*
output "vlans_initial-list"          {
  depends_on                        = []
  value                             = module.vlans_initial-data.list
}

output "vlans_initial-map"          {
  depends_on                        = []
  value                             = module.vlans_initial-data.map
}
*/

output "vlans-list"          {
  depends_on                        = [
                                        module.vlans-data
  ]
  value                             = module.vlans-data.list
}

output "vlans-map"          {
  depends_on                        = [
                                        module.vlans-data
  ]
  value                             = module.vlans-data.map
}