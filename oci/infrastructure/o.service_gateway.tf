output "service_gateway-map" {
  depends_on                        = [
                                        module.compartments-create,
                                        module.compartments-list,
                                        module.service_gateway-create,
                                        module.vcns-create
  ]
  description                       = "display map of service_gateway"
  value                             = (
    var.config.et["default"].infrastructure["service_gateway"].outputs["map"].enable                     == true   ? (
      var.config.et[var.local.execution_target.name].infrastructure.modules["service_gateway"].enable    == false ||
      var.config.et["default"].infrastructure.modules["service_gateway"].enable                          == false
      ? {} #module.service_gateway-list["service_gateway-map"]
      : module.service_gateway-create["service_gateway-map"]
    ) : null
  ) 
}

output "service_gateway-list" {
  depends_on                        = [
                                        module.compartments-create,
                                        module.compartments-list,
                                        module.service_gateway-create,
                                        module.vcns-create 
  ]
  description                       = "display list of service_gateway"
  value                             = (
    var.config.et["default"].infrastructure["service_gateway"].outputs["list"].enable                    == true  ? (
      var.config.et[var.local.execution_target.name].infrastructure.modules["service_gateway"].enable    == false ||
      var.config.et["default"].infrastructure.modules["service_gateway"].enable                          == false
      ? {} #module.service_gateway-list["service_gateway-list"]
      : module.service_gateway-create["service_gateway-list"]
    ) : null
  )
}

output "service_gateway-raw" {
  depends_on                        = [
                                        module.compartments-create,
                                        module.compartments-list,
                                        module.service_gateway-create,
                                        module.vcns-create
  ]
  description                       = "display raw output of service_gateway"
  value                             = (
    var.config.et["default"].infrastructure["service_gateway"].outputs["raw"].enable                     == true  ? (
      var.config.et[var.local.execution_target.name].infrastructure.modules["service_gateway"].enable    == false ||
      var.config.et["default"].infrastructure.modules["service_gateway"].enable                          == false
      ? {}
      : module.service_gateway-create["service_gateway-raw"]
    ) : null
  )
}