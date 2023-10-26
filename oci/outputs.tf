#AVAILABILTY/FAULT DOMAIN######################################################

/*
output "availabilitydomains_count" {
  value                           = module.availabilitydomains.count
}

output "availabilitydomains" {
  value                           = module.availabilitydomains.list
}
*/

output "ad_fd-map" {
  value                           = module.faultdomains.map
}

/*
output "ad1_fd1" {
  value                           = flatten(module.faultdomains.ad_fd[0])[0]
}

output "ad2_fd1" {
  value                           = flatten(module.faultdomains.ad_fd[1])[0]
}
*/

output "ad_fd-list" {
  value                           = module.faultdomains.list
}

/*
output "ad_fd-list_targeted" {
  value                           = flatten(module.faultdomains.ad_fd[*])[3]
}
*/

#COMPARTMENTS##################################################################

/*
output "compartments0_initial-list" {
  depends_on                      = [
                                      module.compartments_initial-data
  ]
  value                           = module.compartments_initial-data.list
}

output "compartments0_initial-map" {
  depends_on                      = [
                                      module.compartments_initial-data
  ]
  value                           = module.compartments_initial-data.map
}
*/

/*
output "compartments1_parent-map" {
  depends_on                      = [  
                                    module.compartments_parent-data
                                  ]
  value                           = module.compartments_parent-data.map
}
*/

/*
output "compartments2_child-map" {
  depends_on                      = [  
                                    module.compartments_child-data
                                  ]
  value                           = module.compartments_child-data.map
}
*/

/*
output "compartments3_gchild-map" {
  depends_on                      = [  
                                    module.compartments_gchild-data
                                  ]
  value                           = module.compartments_gchild-data.map
}
*/

/*
output "compartments4_ggchild-map" {
  depends_on                      = [  
                                    module.compartments_ggchild-data
                                  ]
  value                           = module.compartments_ggchild-data.map
}
*/

output "compartments-list"         {
  depends_on                      = [  
                                    module.compartments_ggchild-data
                                  ]
  value                           = module.compartments_ggchild-data.list
}

output "compartments-map"         {
  depends_on                      = [  
                                    module.compartments_ggchild-data
                                  ]
  value                           = module.compartments_ggchild-data.map
}

#GROUPS########################################################################
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


#USERS#########################################################################
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
