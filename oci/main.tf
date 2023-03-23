# module "list_ad" {
#   source              = "./modules/list/ad"

#   ad_compartment_id   = var.tenancy["oci"].ocid
# }

module "create_compartment" {
  source                = "./modules/create/compartment"

  compartment-et        = local.execution_target
  compartment-et_map    = var.et
  compartment-instance_map = var.instance[local.execution_target]
  compartment-region_map = var.region
}

module "list_compartment" {
  source                = "./modules/list/compartment"

  compartment_id        = var.tenancy["oci"].ocid
}

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