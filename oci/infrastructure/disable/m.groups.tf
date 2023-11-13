module "groups_initial-data"         {
  depends_on                        = []
  id                                = var.tenancy[var.local.execution_target.name].id
  source                            = "./modules/groups/list"
}

module "groups-create"               {
  compartment_map                   = module.compartments-data.map
  depends_on                        = [
                                        module.compartments-data,
                                        module.groups_initial-data
  ]
  default_map                       = var.config.et["default"].infrastructure
  et_map                            = var.config.et[var.local.execution_target.name].infrastructure
  id                                = var.tenancy[var.local.execution_target.name].id
  source                            = "./modules/groups/create"
}

module "groups-data"                 {
  depends_on                        = [
                                        module.groups-create
  ]
  id                                = var.tenancy[var.local.execution_target.name].id
  source                            = "./modules/groups/list"
}

