output "route_table-map" {
  depends_on                        = [
                                        module.compartments-create,
                                        module.compartments-list,
                                        module.internet_gateway-create,
                                        module.route_table-create,
                                        module.service_gateway-create,
                                        module.vcns-create
  ]
  description                       = "display map of route_table"
  value                             = (
    var.config.et["default"].infrastructure["route_table"].outputs["map"].enable                     == true   ? (
      var.config.et[var.local.execution_target.name].infrastructure.modules["route_table"].enable    == false ||
      var.config.et["default"].infrastructure.modules["route_table"].enable                          == false
      ? {} #module.route_table-list["route_table-map"]
      : module.route_table-create["route_table-map"]
    ) : null
  ) 
}

output "route_table-list" {
  depends_on                        = [
                                        module.compartments-create,
                                        module.compartments-list,
                                        module.internet_gateway-create,
                                        module.route_table-create,
                                        module.service_gateway-create,
                                        module.vcns-create
  ]
  description                       = "display list of route_table"
  value                             = (
    var.config.et["default"].infrastructure["route_table"].outputs["list"].enable                    == true  ? (
      var.config.et[var.local.execution_target.name].infrastructure.modules["route_table"].enable    == false ||
      var.config.et["default"].infrastructure.modules["route_table"].enable                          == false
      ? {} #module.route_table-list["route_table-list"]
      : module.route_table-create["route_table-list"]
    ) : null
  )
}

output "route_table-raw" {
  depends_on                        = [
                                        module.compartments-create,
                                        module.compartments-list,
                                        module.internet_gateway-create,
                                        module.route_table-create,
                                        module.service_gateway-create,
                                        module.vcns-create
  ]
  description                       = "display raw output of route_table"
  value                             = (
    var.config.et["default"].infrastructure["route_table"].outputs["raw"].enable                     == true  ? (
      var.config.et[var.local.execution_target.name].infrastructure.modules["route_table"].enable    == false ||
      var.config.et["default"].infrastructure.modules["route_table"].enable                          == false
      ? {}
      : module.route_table-create["route_table-raw"]
    ) : null
  )
}