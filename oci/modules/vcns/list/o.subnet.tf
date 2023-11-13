output "subnet-map"                 {
    value                           = ({
      for label, setting in data.oci_core_subnets.list : label => setting
        if length(setting.subnets) > 0 
  })
}

output "subnet-list"                {
  depends_on                        = []
  value                             = ([
    for label, setting in data.oci_core_subnets.list : {
      "compartment_id"              = setting.compartment_id
      "id"                          = setting.id 
      "subnets"                     = setting.subnets
      "name"                        = label
    }
  ])
}