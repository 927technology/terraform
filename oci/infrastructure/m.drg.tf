module "drg-create"                 { # reads var.config and creates drg
  after                             = [
                                        module.compartments-create
  ]
  compartments_map                  = module.compartments-create.map
  default_map                       = var.config.et["default"].infrastructure
  depends_on                        = [
                                        module.compartments-create,
                                        module.vcns-create
  ]
  et_map                            = var.config.et[var.local.execution_target.name].infrastructure
  source                            = "./modules/drg/create"
  tenancy_map                       = var.tenancy[var.local.execution_target.name]
}