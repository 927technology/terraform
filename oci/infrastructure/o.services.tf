output "services-map" {
  depends_on                        = []
  description                       = "display map of services"
  value                             = (
    var.config.et["default"].infrastructure["services"].outputs["map"].enable                     == true
      ? module.services-list["services-map"]
      : null
  ) 
}

output "services-list" {
  depends_on                        = []
  description                       = "display list of services"
  value                             = (
    var.config.et["default"].infrastructure["services"].outputs["list"].enable                    == true
      ? module.services-list["services-list"]
      : null
  )
}

output "services-raw" {
  depends_on                        = []
  description                       = "display raw output of services"
  value                             = (
    var.config.et["default"].infrastructure["services"].outputs["raw"].enable                     == true
      ? module.services-list["services-raw"]
      : null
  )
}