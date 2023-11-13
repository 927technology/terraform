module "vcns-create"                { # reads var.config and creates vcns
  after                             = [
                                        module.compartments-create
  ]
  compartments_map                  = module.compartments-create.map
  default_map                       = var.config.et["default"].infrastructure
  depends_on                        = [
                                        module.compartments-create
  ]
  et_map                            = var.config.et[var.local.execution_target.name].infrastructure
  source                            = "./modules/vcns/create"
}

/*
module "vcns-list"                  { # reads var.config and lists vcns
  after                             = [
                                        module.compartments-create
  ]
  compartments_map                  = module.compartments-create.map
  default_map                       = var.config.et["default"].infrastructure
  depends_on                        = [
                                        module.compartments-create
  ]
  et_map                            = var.config.et[var.local.execution_target.name].infrastructure
  source                            = "./modules/vcns/list"
}
*/