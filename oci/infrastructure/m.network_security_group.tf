module "network_security_group-create"                { # reads var.config and creates vcns
  after                             = [
                                        module.compartments-create
  ]
  compartments_map                  = module.compartments-create.map
  default_map                       = var.config.et["default"].infrastructure
  depends_on                        = [
                                        module.compartments-create
  ]
  et_map                            = var.config.et[var.local.execution_target.name].infrastructure
  source                            = "./modules/network_security_group/create"
  vcns_map                          = module.vcns-create.vcns-map
}