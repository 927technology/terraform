output  "count" {
  description                       = ""
  sensitive                         = false
  value                             = length(data.oci_identity_availability_domains.list.availability_domains)
}

output  "list" {
  description                       = ""
  sensitive                         = false
  value                             = ([
      for ad in data.oci_identity_availability_domains.list.availability_domains :
        {
          "fullname"                = ad.name
          "name"                    = split(":",ad.name)[1]
          "prefix"                  = split(":",ad.name)[0]
        }
    
  ])
}