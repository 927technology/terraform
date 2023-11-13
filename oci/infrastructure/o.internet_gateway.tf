output "internet_gateway-map" {
  depends_on                        = [
                                        module.compartments-create,
                                        module.compartments-list,
                                        module.internet_gateway-create,
                                        module.vcns-create
  ]
  description                       = "display map of internet_gateway"
  value                             = (
    var.config.et["default"].infrastructure["internet_gateway"].outputs["map"].enable                     == true   ? (
      var.config.et[var.local.execution_target.name].infrastructure.modules["internet_gateway"].enable    == false ||
      var.config.et["default"].infrastructure.modules["internet_gateway"].enable                          == false
      ? {} #module.internet_gateway-list["internet_gateway-map"]
      : module.internet_gateway-create["internet_gateway-map"]
    ) : null
  ) 
}

output "internet_gateway-list" {
  depends_on                        = [
                                        module.compartments-create,
                                        module.compartments-list,
                                        module.internet_gateway-create,
                                        module.vcns-create 
  ]
  description                       = "display list of internet_gateway"
  value                             = (
    var.config.et["default"].infrastructure["internet_gateway"].outputs["list"].enable                    == true  ? (
      var.config.et[var.local.execution_target.name].infrastructure.modules["internet_gateway"].enable    == false ||
      var.config.et["default"].infrastructure.modules["internet_gateway"].enable                          == false
      ? {} #module.internet_gateway-list["internet_gateway-list"]
      : module.internet_gateway-create["internet_gateway-list"]
    ) : null
  )
}

output "internet_gateway-raw" {
  depends_on                        = [
                                        module.compartments-create,
                                        module.compartments-list,
                                        module.internet_gateway-create,
                                        module.vcns-create
  ]
  description                       = "display raw output of internet_gateway"
  value                             = (
    var.config.et["default"].infrastructure["internet_gateway"].outputs["raw"].enable                     == true  ? (
      var.config.et[var.local.execution_target.name].infrastructure.modules["internet_gateway"].enable    == false ||
      var.config.et["default"].infrastructure.modules["internet_gateway"].enable                          == false
      ? {}
      : module.internet_gateway-create["internet_gateway-raw"]
    ) : null
  )
}