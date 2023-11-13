output "network_security_group-map" {
  depends_on                        = [
                                        module.compartments-create,
                                        module.compartments-list,
                                        module.network_security_group-create,
                                        module.vcns-create
  ]
  description                       = "display map of network_security_group"
  value                             = (
    var.config.et["default"].infrastructure["network_security_group"].outputs["map"].enable                     == true   ? (
      var.config.et[var.local.execution_target.name].infrastructure.modules["network_security_group"].enable    == false ||
      var.config.et["default"].infrastructure.modules["network_security_group"].enable                          == false
      ? {} #module.network_security_group-list["network_security_group-map"]
      : module.network_security_group-create["network_security_group-map"]
    ) : null
  ) 
}

output "network_security_group-list" {
  depends_on                        = [
                                        module.compartments-create,
                                        module.compartments-list,
                                        module.network_security_group-create,
                                        module.vcns-create 
  ]
  description                       = "display list of network_security_group"
  value                             = (
    var.config.et["default"].infrastructure["network_security_group"].outputs["list"].enable                    == true  ? (
      var.config.et[var.local.execution_target.name].infrastructure.modules["network_security_group"].enable    == false ||
      var.config.et["default"].infrastructure.modules["network_security_group"].enable                          == false
      ? {} #module.network_security_group-list["network_security_group-list"]
      : module.network_security_group-create["network_security_group-list"]
    ) : null
  )
}

output "network_security_group-raw" {
  depends_on                        = [
                                        module.compartments-create,
                                        module.compartments-list,
                                        module.network_security_group-create,
                                        module.vcns-create
  ]
  description                       = "display raw output of network_security_group"
  value                             = (
    var.config.et["default"].infrastructure["network_security_group"].outputs["raw"].enable                     == true  ? (
      var.config.et[var.local.execution_target.name].infrastructure.modules["network_security_group"].enable    == false ||
      var.config.et["default"].infrastructure.modules["network_security_group"].enable                          == false
      ? {}
      : module.network_security_group-create["network_security_group-raw"]
    ) : null
  )
}