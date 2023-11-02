/*
output "availabilitydomains_count" {
  value                           = module.availabilitydomains.count
}

output "availabilitydomains" {
  value                           = module.availabilitydomains.list
}
*/

output "ad_fd-map" {
  value                           = module.faultdomains.map
}

/*
output "ad1_fd1" {
  value                           = flatten(module.faultdomains.ad_fd[0])[0]
}

output "ad2_fd1" {
  value                           = flatten(module.faultdomains.ad_fd[1])[0]
}
*/

output "ad_fd-list" {
  value                           = module.faultdomains.list
}

/*
output "ad_fd-list_targeted" {
  value                           = flatten(module.faultdomains.ad_fd[*])[3]
}
*/