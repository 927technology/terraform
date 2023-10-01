output  "all" {
  description                     = ""
  sensitive                       = false
  value                           = data.oci_identity_availability_domains.list.availability_domains
}


/*
output "map" {
  description                     = ""
  #sensitive                       = false
  value                           = flatten([
      for ad in keys(data.oci_identity_availability_domains.list.availability_domains) : [
        for fd in keys(data.oci_identity_fault_domains.list)                                : {
          availability_domain_id  = ad.name
          availability_domain_name = ad.name
        }
      ]
  ])
}

  description         = ""
  #value               = data.oci_identity_groups.list.groups
  value               = ({
    for label, setting in data.oci_identity_groups.list.groups : setting.name => setting
  })
  sensitive           = false



    role=flatten([
    for label in keys(var.et_map.users)               : [
      for group in var.et_map.users[label].groups     : {
        user                      = label
        group                     = group
      }
    ]
  ])
*/