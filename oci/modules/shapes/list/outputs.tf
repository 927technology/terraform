output "map" {
  value =  ({
    for ad, config in data.oci_core_shapes.list :
      ad => {
        for shape, config in config.shapes :
          config.name => config
      }
  })
}