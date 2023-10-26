#LIST COMPARTMENTS#############################################################

module "compartments_initial-data"  {
  default_map                     = var.config.et["default"].infrastructure
  depends_on                      = []
  id                              = var.tenancy[var.local.execution_target.name].id
  source                          = "./modules/compartments/list"
  tenancy_map                     = var.tenancy[var.local.execution_target.name]
}

## PARENT - CREATE AND REFRESH COMPARTMENT LIST
module "compartments_parent-create" {
  compartments_map                = module.compartments_initial-data.map
  default_map                     = var.config.et["default"].infrastructure
  depends_on                      = [
                                      module.compartments_initial-data
  ]
  et_map                          = var.config.et[var.local.execution_target.name].infrastructure
  relationship                    = "parent"
  source                          = "./modules/compartments/create"
  tenancy_map                     = var.tenancy[var.local.execution_target.name]
}

# creates a new map of compartments including those added in module.compartments_create-parent
module "compartments_parent-data"  {
  default_map                     = var.config.et["default"].infrastructure
  depends_on                      = [
                                      module.compartments_parent-create
  ]
  id                              = var.tenancy[var.local.execution_target.name].id
  source                          = "./modules/compartments/list"
  tenancy_map                     = var.tenancy[var.local.execution_target.name]
}

## CHILD - CREATE AND REFRESH COMPARTMENT LIST
module "compartments_child-create" {
  compartments_map                = module.compartments_parent-data.map
  default_map                     = var.config.et["default"].infrastructure
  depends_on                      = [
                                      module.compartments_parent-data
  ]
  et_map                          = var.config.et[var.local.execution_target.name].infrastructure
  relationship                    = "child"
  source                          = "./modules/compartments/create"
  tenancy_map                     = var.tenancy[var.local.execution_target.name]
}

# creates a new map of compartments including those added in module.compartments_create-child
module "compartments_child-data"  {
  default_map                     = var.config.et["default"].infrastructure
  depends_on                      = [
                                      module.compartments_child-create
  ]
  id                              = var.tenancy[var.local.execution_target.name].id
  source                          = "./modules/compartments/list"
  tenancy_map                     = var.tenancy[var.local.execution_target.name]
}

## GCHILD - CREATE AND REFRESH COMPARTMENT LIST
module "compartments_gchild-create" {
  compartments_map                = module.compartments_child-data.map
  default_map                     = var.config.et["default"].infrastructure
  depends_on                      = [
                                      module.compartments_child-data
  ]
  et_map                          = var.config.et[var.local.execution_target.name].infrastructure
  relationship                    = "gchild"
  source                          = "./modules/compartments/create"
  tenancy_map                     = var.tenancy[var.local.execution_target.name]
}

# creates a new map of compartments including those added in module.compartments_create-child
module "compartments_gchild-data" {
  default_map                     = var.config.et["default"].infrastructure
  depends_on                      = [
                                      module.compartments_gchild-create
  ]
  id                              = var.tenancy[var.local.execution_target.name].id
  source                          = "./modules/compartments/list"
  tenancy_map                     = var.tenancy[var.local.execution_target.name]
}

## GGCHILD - CREATE AND REFRESH COMPARTMENT LIST
module "compartments_ggchild-create" {
  compartments_map                = module.compartments_gchild-data.map
  default_map                     = var.config.et["default"].infrastructure
  depends_on                      = [
                                      module.compartments_gchild-data
  ]
  et_map                          = var.config.et[var.local.execution_target.name].infrastructure
  relationship                    = "ggchild"
  source                          = "./modules/compartments/create"
  tenancy_map                     = var.tenancy[var.local.execution_target.name]
}

# creates a new map of compartments including those added in module.compartments_create-child
module "compartments_ggchild-data"  {
  default_map                     = var.config.et["default"].infrastructure
  depends_on                      = [
                                      module.compartments_ggchild-create
  ]
  id                              = var.tenancy[var.local.execution_target.name].id
  source                          = "./modules/compartments/list"
  tenancy_map                     = var.tenancy[var.local.execution_target.name]

}

## FINAL - REFRESH COMPARTMENT LIST
module "compartments-data"        {
  default_map                   = var.config.et["default"].infrastructure
  depends_on                      = [
                                      module.compartments_ggchild-create
  ]
  id                              = var.tenancy[var.local.execution_target.name].id
  source                          = "./modules/compartments/list"
  tenancy_map                     = var.tenancy[var.local.execution_target.name]

}