module "route_table-create"         { # reads var.config and creates route_table
  after                             = [
                                        module.compartments-create,
                                        module.compartments-list,
                                        module.internet_gateway-create,
                                        module.service_gateway-create,
                                        module.vcns-create
  ]
  compartments_map                  = module.compartments-create.map
  default_map                       = var.config.et["default"].infrastructure
  depends_on                        = [
                                        module.compartments-create,
                                        module.compartments-list,
                                        module.internet_gateway-create,
                                        module.service_gateway-create,
                                        module.vcns-create
  ]
  et_map                            = var.config.et[var.local.execution_target.name].infrastructure
  internet_gateway_map              = module.internet_gateway-create["internet_gateway-map"]
  service_gateway_map               = module.service_gateway-create["service_gateway-map"]
  source                            = "./modules/route_table/create"
  tenancy_map                       = var.tenancy[var.local.execution_target.name]
  vcns_map                          = module.vcns-create.vcns-map
}