output "shapes-list"                {
  depends_on                        = [
                                        module.compartments-create
  ]
  description                       = "display map of compartments"
  value                             = (
    var.config.et["default"].infrastructure["shapes"].outputs["list"].enable == true
      ? module.shapes["list"]
      : null
  ) 
}

output "shapes-map"                 {
  depends_on                        = [
                                        module.compartments-create
  ]
  description                       = "display map of compartments"
  value                             = (
    var.config.et["default"].infrastructure["shapes"].outputs["list"].enable == true
      ? module.shapes["map"]
      : null
  ) 
}