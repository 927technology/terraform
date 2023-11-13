/*
output "map"                        {
    value                           = ({
      for label, setting in data.oci_core_subnets.list : label => setting
        if length(setting.subnets) > 0 
  })
}
*/

/*
output "list"                       {
  depends_on                        = []
  value                             = ([
    for label, setting in data.oci_core_subnets.list : {
      "compartment_id"              = setting.compartment_id
      "id"                          = setting.id 
      "subnets"      = setting.subnets
      "name"                        = label
    }
  ])
}
*/

output "raw"                        {
    depends_on                      = []
    value                           = data.oci_core_subnets.list
}

/*
output "test"                       {
  depends_on                        = []
  value                             = null
}
*/