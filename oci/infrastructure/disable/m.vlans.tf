module "vlans_initial-data"          {
  compartment                       = "root"
  compartment_map                   = module.compartments-data.map
  depends_on                        = [  
                                        module.compartments-data
  ]
  source                            = "./modules/vlans/list"
  tenancy_map                       = var.tenancy[var.local.execution_target.name]
}


module "vlans-create"               {
  compartment_map                   = module.compartments-data.map
  depends_on                        = [
                                        module.compartments-data,
                                        module.vcns-data,
                                        module.vlans_initial-data
  ]
  default_map                       = var.config.et["default"].infrastructure
  et_map                            = var.config.et[var.local.execution_target.name].infrastructure
  tenancy_map                       = var.tenancy[var.local.execution_target.name].id
  source                            = "./modules/vlans/create"
  vcn_map                           = module.vcns-data.map
}
 

module "vlans-data"                 {
  compartment                       = "root"
  compartment_map                   = module.compartments-data.map
  depends_on                        = [
                                        module.compartments-data,
                                        module.vlans-create
  ]
  source                            = "./modules/vlans/list"
  tenancy_map                       = var.tenancy[var.local.execution_target.name].id
}