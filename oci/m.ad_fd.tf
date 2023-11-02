#AVAILABILTY/FAULT DOMAIN######################################################

module "availabilitydomains" {
  tenancy_map                     = var.tenancy[var.local.execution_target.name]
  source                          = "./modules/availabilitydomains/list"
}


module "faultdomains" {
  availabilitydomains             = [
                                      module.availabilitydomains.list[0].fullname,
                                      module.availabilitydomains.list[1].fullname,
                                      module.availabilitydomains.list[2].fullname
                                    ]
  tenancy_map                     = var.tenancy[var.local.execution_target.name]
  source                          = "./modules/faultdomains/list"
}


