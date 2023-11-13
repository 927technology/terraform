output "list"                       {
  value                             =  data.oci_core_shapes.list 
}

output "map"                        {
  value                             =  ({
    for ad, config in data.oci_core_shapes.list :
      ad => {
        for shape, config in config.shapes :
          config.name => config
      }
  })
}

output "raw"                        {
  value                             =  data.oci_core_shapes.list
}

output "test"                       {
  value                             = null
}