module "users_initial-data"         {
  depends_on                        = []
  id                                = var.tenancy[var.local.execution_target.name].id
  source                            = "./modules/users/list"
}

output "users_initial-map"          {
  depends_on                        = [ 
                                        module.users_initial-data 
  ]
  value                             = module.users_initial-data.map

}

module "users-create"               {
  compartment_map                   = module.compartments-data.map
  depends_on                        = [
                                        module.compartments-data,
                                        module.users_initial-data
  ]
  default_map                       = var.config.et["default"].infrastructure
  et_map                            = var.config.et[var.local.execution_target.name].infrastructure
  id                                = var.tenancy[var.local.execution_target.name].id
  source                            = "./modules/users/create"
  tenancy_map                       = var.tenancy
}

module "users-data"                 {
  depends_on                        = [
                                        module.users-create
  ]
  id                                = var.tenancy[var.local.execution_target.name].id
  source                            = "./modules/users/list"
}

output "users-map"                  {
  depends_on                        = [ 
                                        module.users-data 
  ]
  value                             = module.users-data.map

}