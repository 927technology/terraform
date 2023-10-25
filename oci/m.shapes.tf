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

/*
output "shapes-list" {
    value                           = module.shapes.list
}
*/
output "shapes-map" {
    value                           = module.shapes.map
}