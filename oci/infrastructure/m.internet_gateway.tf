module "internet_gateway-create"    { # reads var.config and creates internet_gateway
  after                             = [
                                        module.compartments-create,
                                        module.vcns-create
  ]
  compartments_map                  = module.compartments-create.map
  default_map                       = var.config.et["default"].infrastructure
  depends_on                        = [
                                        module.compartments-create,
                                        module.vcns-create
  ]
  et_map                            = var.config.et[var.local.execution_target.name].infrastructure
  source                            = "./modules/internet_gateway/create"
  tenancy_map                       = var.tenancy[var.local.execution_target.name]
  vcns_map                          = module.vcns-create.vcns-map
}