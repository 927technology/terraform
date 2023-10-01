#AVAILABILTY/FAULT DOMAIN######################################################

module "availabilitydomains_list" {
  depends_on                      = []
  tenancy_map                     = var.tenancy[var.local.execution_target.name]
  source                          = "./modules/availabilitydomains/list"
}

output "availabilitydomain_list" {
  value                           = module.availabilitydomains_list.all
}

module "faultdomains_list" {
  availability_domains            = module.availabilitydomains_list.all 
  depends_on                      = []
  tenancy_map                     = var.tenancy[var.local.execution_target.name]
  source                          = "./modules/faultdomains/list"
}

output "faultdomains_list" {
  value                           = module.faultdomains_list
}



#COMPARTMENTS##################################################################

## POPULATE THE INITIAL COMPARTMENT LIST
module "compartments_list-pre"    {
  depends_on                      = []
  id                              = var.tenancy[var.local.execution_target.name].id
  source                          = "./modules/compartments/list"
}

## PARENT - CREATE AND REFRESH COMPARTMENT LIST
module "compartments_create-parent" {
  compartment_map                 = ({
    for label, setting in module.compartments_list-pre.all : setting.name => setting
  })
  default_map-modules             = var.config.et["default"].modules.compartments
  depends_on                      = [
    module.compartments_list-pre
  ]
  et_map-compartments             = var.config.et[var.local.execution_target.name].compartments
  et_map-modules                  = var.config.et[var.local.execution_target.name].modules.compartments
  relationship                    = "parent"
  source                          = "./modules/compartments/create"
  tenancy_map                     = var.tenancy[var.local.execution_target.name]

}

module "compartments_list-parent" {
  depends_on                      = [
    module.compartments_create-parent
  ]
  id                              = var.tenancy[var.local.execution_target.name].id
  source                          = "./modules/compartments/list"
}

## CHILD - CREATE AND REFRESH COMPARTMENT LIST
module "compartments_create-child" {
  compartment_map                 = ({
    for label, setting in module.compartments_list-parent.all : setting.name => setting
  })
  default_map-modules             = var.config.et["default"].modules.compartments
  depends_on                      = [
    module.compartments_list-parent
  ]
  et_map-compartments             = var.config.et[var.local.execution_target.name].compartments
  et_map-modules                  = var.config.et[var.local.execution_target.name].modules.compartments
  relationship                    = "child"
  source                          = "./modules/compartments/create"
  tenancy_map                     = var.tenancy[var.local.execution_target.name]
}

module "compartments_list-child"  {
  depends_on                      = [
    module.compartments_create-child
  ]
  id                              = var.tenancy[var.local.execution_target.name].id
  source                          = "./modules/compartments/list"
}

## GRAND CHILD - CREATE AND REFRESH COMPARTMENT LIST
module "compartments_create-gchild" {
  compartment_map                 = ({
    for label, setting in module.compartments_list-child.all : setting.name => setting
  })
  default_map-modules             = var.config.et["default"].modules.compartments
  depends_on                      = [
    module.compartments_list-child
  ]
  et_map-compartments             = var.config.et[var.local.execution_target.name].compartments
  et_map-modules                  = var.config.et[var.local.execution_target.name].modules.compartments
  relationship                    = "gchild"
  source                          = "./modules/compartments/create"
  tenancy_map                     = var.tenancy[var.local.execution_target.name]
}

module "compartments_list-gchild" {
  depends_on                      = [
    module.compartments_create-child
  ]
  id                              = var.tenancy[var.local.execution_target.name].id
  source                          = "./modules/compartments/list"
}

## GREAT GRAND CHILD (post) - CREATE AND REFRESH COMPARTMENT LIST
module "compartments_create-ggchild" {
  compartment_map                 = ({
    for label, setting in module.compartments_list-gchild.all : setting.name => setting
  })
  default_map-modules             = var.config.et["default"].modules.compartments
  depends_on                      = [
    module.compartments_list-gchild
  ]
  et_map-compartments             = var.config.et[var.local.execution_target.name].compartments
  et_map-modules                  = var.config.et[var.local.execution_target.name].modules.compartments
  relationship                    = "ggchild"
  source                          = "./modules/compartments/create"
  tenancy_map                     = var.tenancy[var.local.execution_target.name]
}

module "compartments_list-post" {
  after                           = [
    module.compartments_create-ggchild.after,
  ]
  depends_on                      = [
    module.compartments_create-ggchild
  ]
  id                              = var.tenancy[var.local.execution_target.name].id
  source                          = "./modules/compartments/list"
}

## OUTPUT ALL COMPARTMENTS ROOT -> GGCHILD (post)
output "compartments_map"    {
  description                     = "list all compartments"
  depends_on                      = [  
    module.compartments_list-gchild
  ]
  sensitive                       = false 
  value                           = ({
    for label, setting in module.compartments_list-post.all : setting.name => setting
  })
}



#USERS#########################################################################
module "users_list-pre"           {
  depends_on                      = [
    module.compartments_list-post,
  ]
  id                              = var.tenancy[var.local.execution_target.name].id
  source                          = "./modules/users/list"
}

module "users_create"             {
  compartment_map                 = ({
    for label, setting in module.compartments_list-post.all : setting.name => setting
  })
  default_map-users               = var.config.et["default"].modules.users
  depends_on                      = [  
    module.users_list-pre
  ]
  et_map-users                    = var.config.et[var.local.execution_target.name].users
  et_map-modules                  = var.config.et[var.local.execution_target.name].modules.users
  tenancy_map                     = var.tenancy[var.local.execution_target.name]
  source                          = "./modules/users/create"
}

module "users_list-post"          {
  depends_on                      = [
    module.users_create,
  ]
  id                              = var.tenancy[var.local.execution_target.name].id
  source                          = "./modules/users/list"
}

output "users_map"               {
  depends_on                      = [
    module.users_list-post,
  ]
  value                           = module.users_list-post.all
}


#GROUPS########################################################################
module "groups_list-pre"          {
  depends_on                      = [
    module.users_list-post
  ]
  id                              = var.tenancy[var.local.execution_target.name].id
  source                          = "./modules/groups/list"
}

module "groups_create"            {
  compartment_map                 = ({
    for label, setting in module.compartments_list-post.all : setting.name => setting
  })
  default_map                     = var.config.et["default"]
  depends_on                      = [  
    module.groups_list-pre
  ]
  et_map                          = var.config.et[var.local.execution_target.name]
  tenancy_map                     = var.tenancy[var.local.execution_target.name]
  source                          = "./modules/groups/create"
}

module "groups_list-post"         {
  depends_on                      = [
    module.groups_create
  ]
  id                              = var.tenancy[var.local.execution_target.name].id
  source                          = "./modules/groups/list"
}

output "groups_map"   {
  depends_on                      = [
    module.groups_list-post
  ]
  value                           = module.groups_list-post.all
}


#GROUP MEMBERSHIPS#############################################################
/*
module "groupmemberships_list-pre" {
  depends_on                      = []
  groups_list-all                 = module.groups_list-pre.all
  source                          = "./modules/groupmembership/list"
  tenancy_map                     = var.tenancy[var.local.execution_target.name]

}
*/
module "groupmemberships_create"  {
  depends_on                      = [  
    module.groups_create,
    module.groups_list-post,
    module.users_create,
    module.users_list-post,
  ]
  default_map                     = var.config.et["default"]
  et_map                          = var.config.et[var.local.execution_target.name]
  groups_map                      = module.groups_list-post.all
  users_map                       = module.users_list-post.all
  source                          = "./modules/groupmembership/create"
}

/*
# this does not work on first run due to groups not being populated yet
module "groupmemberships_list-post" {
  depends_on                      = [
    module.groupmemberships_create
  ]
  groups_list-all                 = module.groups_list-post.all
  source                          = "./modules/groupmembership/list"
  tenancy_map                     = var.tenancy[var.local.execution_target.name]

}

*/
output "groupmemberships_list"  {
  depends_on                      = [
    module.groupmemberships_create
  ]
  value                           = module.groupmemberships_create.locals
  #value                           = module.groupmemberships_list-post.groups
}










# module "list_ad" {
#   source              = "./modules/list/ad"

#   ad_compartment_id   = var.tenancy["oci"].ocid
# }

# module "create_compartment" {
#   source                = "./modules/create/compartment"

#   compartment-et        = local.execution_target
#   compartment-et_map    = var.et
#   compartment-instance_map = var.instance[local.execution_target]
#   compartment-region_map = var.region
# }



# module "list_image" {
#   source              = "./modules/list/image"

#   image_compartment_id = var.tenancy["oci"].ocid
# }

# module "list_instance" {
#   source              = "./modules/list/instance"

#   instance_compartment_id = var.tenancy["oci"].ocid
#   instance_filter     = "some-instance"
# }

# module "list_shape" {
#   source              = "./modules/list/shape"

#   shape_compartment_id = var.tenancy["oci"].ocid
# }

# module "search_image-windows" {
#   source              = "./modules/list/image"

#   image_compartment_id = var.tenancy["oci"].ocid
#   image_filter        = "Oracle Linux"
# }