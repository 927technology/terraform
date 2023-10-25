#AVAILABILTY/FAULT DOMAIN######################################################

module "availabilitydomains" {
  depends_on                      = []
  tenancy_map                     = var.tenancy[var.local.execution_target.name]
  source                          = "./modules/availabilitydomains/list"
}


module "faultdomains" {
  availabilitydomains             = [
                                      module.availabilitydomains.list[0].fullname,
                                      module.availabilitydomains.list[1].fullname,
                                      module.availabilitydomains.list[2].fullname
                                    ]
  depends_on                      = []
  tenancy_map                     = var.tenancy[var.local.execution_target.name]
  source                          = "./modules/faultdomains/list"
}


