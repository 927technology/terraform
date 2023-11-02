
module "local_peering_gateways-create" {
  after                             = [
                                        module.compartments-create,
                                        module.vcns-create
  ]
  compartment_map                   = module.compartments-create.map
  default_map                       = var.config.et["default"].infrastructure
  depends_on                        = [
                                        module.compartments-create,
                                        module.vcns-create
  ]
  et_map                            = var.config.et[var.local.execution_target.name].infrastructure
  source                            = "./modules/local_peering_gateways/create"
  vcn_map                           = module.vcns-create.map
}

module "local_peering_gateways-list" {
  after                             = [
                                        module.compartments-create,
                                        module.vcns-create
  ]
  compartment_map                   = module.compartments-create.map
  default_map                       = var.config.et["default"].infrastructure
  depends_on                        = [
                                        module.compartments-create,
                                        module.vcns-create
  ]
  et_map                            = var.config.et[var.local.execution_target.name].infrastructure
  source                            = "./modules/local_peering_gateways/list"
  vcn_map                           = module.vcns-list.map
}