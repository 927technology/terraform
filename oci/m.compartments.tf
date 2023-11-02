module "compartments-create" {
  default_map                     = var.config.et["default"].infrastructure
  et_map                          = var.config.et[var.local.execution_target.name].infrastructure
  source                          = "./modules/compartments/create"
  tenancy_map                     = var.tenancy[var.local.execution_target.name]
}

module "compartments-list" {
  default_map                     = var.config.et["default"].infrastructure
  et_map                          = var.config.et[var.local.execution_target.name].infrastructure
  source                          = "./modules/compartments/list"
  tenancy_map                     = var.tenancy[var.local.execution_target.name]
}