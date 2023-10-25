/*
output  "ad1" {
  description                     = ""
  sensitive                       = false
  value                           = data.oci_identity_fault_domains.ad1.fault_domains
}
output  "ad2" {
  description                     = ""
  sensitive                       = false
  value                           = data.oci_identity_fault_domains.ad2.fault_domains
}
output  "ad3" {
  description                     = ""
  sensitive                       = false
  value                           = data.oci_identity_fault_domains.ad3.fault_domains
}
*/

/*
output  "count" {
  description                       = ""
  sensitive                         = false
  value                             = length(data.oci_identity_fault_domains.list.fault_domains)
}
*/
output  "map" {
  description                       = ""
  sensitive                         = false
  value                             = ([
    for key in data.oci_identity_fault_domains.list : [
      key.fault_domains  
    ]
  ])
}

/*
output  "list" {
  description                       = ""
  sensitive                         = false
  value                             = data.oci_identity_fault_domains.list
}
*/


/*
output  "list" {
  description                       = ""
  sensitive                         = false
  value                             = ([
      for fd in data.oci_identity_fault_domains.list[each.key].fault_domains : [
        {
          "fullname"                = fd.name
          "id"                      = fd.id
        }
      ]
  ])
}
*/