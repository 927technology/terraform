output "nat_gateway-map" {
  depends_on                        = [
                                        module.compartments-create,
                                        module.compartments-list,
                                        module.nat_gateway-create,
                                        module.vcns-create
  ]
  description                       = "display map of nat_gateway"
  value                             = (
    var.config.et["default"].infrastructure["nat_gateway"].outputs["map"].enable                     == true   ? (
      var.config.et[var.local.execution_target.name].infrastructure.modules["nat_gateway"].enable    == false ||
      var.config.et["default"].infrastructure.modules["nat_gateway"].enable                          == false
      ? {} #module.nat_gateway-list["nat_gateway-map"]
      : module.nat_gateway-create["nat_gateway-map"]
    ) : null
  ) 
}

output "nat_gateway-list" {
  depends_on                        = [
                                        module.compartments-create,
                                        module.compartments-list,
                                        module.nat_gateway-create,
                                        module.vcns-create 
  ]
  description                       = "display list of nat_gateway"
  value                             = (
    var.config.et["default"].infrastructure["nat_gateway"].outputs["list"].enable                    == true  ? (
      var.config.et[var.local.execution_target.name].infrastructure.modules["nat_gateway"].enable    == false ||
      var.config.et["default"].infrastructure.modules["nat_gateway"].enable                          == false
      ? {} #module.nat_gateway-list["nat_gateway-list"]
      : module.nat_gateway-create["nat_gateway-list"]
    ) : null
  )
}

output "nat_gateway-raw" {
  depends_on                        = [
                                        module.compartments-create,
                                        module.compartments-list,
                                        module.nat_gateway-create,
                                        module.vcns-create
  ]
  description                       = "display raw output of nat_gateway"
  value                             = (
    var.config.et["default"].infrastructure["nat_gateway"].outputs["raw"].enable                     == true  ? (
      var.config.et[var.local.execution_target.name].infrastructure.modules["nat_gateway"].enable    == false ||
      var.config.et["default"].infrastructure.modules["nat_gateway"].enable                          == false
      ? {}
      : module.nat_gateway-create["nat_gateway-raw"]
    ) : null
  )
}