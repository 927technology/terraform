
module "vcns_initial-data"          {
  compartment                       = "root"
  compartment_map                   = module.compartments-data.map
  source                            = "./modules/vcns/list"
  tenancy_map                       = var.tenancy[var.local.execution_target.name]
}


output "vcns_initial-list"          {
  depends_on                        = []
  value                             = module.vcns_initial-data.list
}

output "vcns_initial-map"          {
  depends_on                        = []
  value                             = module.vcns_initial-data.map
}

/*
output "vcns_initial-list"          {
  depends_on                        = []
  value                             = module.vcns_initial-data.map
}


output "vcns_initial-list"          {
  depends_on                        = []
  value                             = ([
    for label, setting in module.vcns_initial-data.map : {
      "name"                        = label
      "compartment_id"              = setting.compartment_id
      "id" = setting.id 
      "virtual_networks" = setting.virtual_networks
    }
  ])
}
*/
/*
module "vcns-create"               {
  compartment_map                   = module.compartments-data.map
  depends_on                        = [
                                        module.compartments-data,
                                        module.vcns_initial-data
  ]
  default_map                       = var.config.et["default"].infrastructure
  et_map                            = var.config.et[var.local.execution_target.name].infrastructure
  tenancy_map                       = var.tenancy[var.local.execution_target.name].id
  source                            = "./modules/vcns/create"
}

module "vcns-data"                 {
  depends_on                        = [
                                        module.vcns-create
  ]
  compartment                       = "root"
  source                            = "./modules/vcns/list"
  tenancy_map                       = var.tenancy[var.local.execution_target.name].id
}
*/