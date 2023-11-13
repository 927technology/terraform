module "shapes" {
  availabilitydomains               = [
                                        module.availabilitydomains.list[0].fullname,
                                        module.availabilitydomains.list[1].fullname,
                                        module.availabilitydomains.list[2].fullname
  ]
  depends_on                        = [ 
                                        module.availabilitydomains 
  ]
  id                                = var.tenancy[var.local.execution_target.name].id
  source                            = "./modules/shapes/list"
}