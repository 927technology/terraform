module "services-list"         { # reads services from oci
  depends_on                        = []
  source                            = "./modules/services/list"
}