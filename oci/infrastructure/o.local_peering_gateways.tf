output "local_peering_gateways-map" {
  depends_on                        = [
                                        module.compartments-create,
                                        module.compartments-list,
                                        module.local_peering_gateways-create #,
                                        #module.local_peering_gateways-list
  ]
  description                       = "display map of local_peering_gateways"
  value                             = (
    var.config.et["default"].infrastructure["local_peering_gateways"].outputs["map"].enable                     == true   ? (
      var.config.et[var.local.execution_target.name].infrastructure.modules["local_peering_gateways"].enable    == false ||
      var.config.et["default"].infrastructure.modules["local_peering_gateways"].enable                          == false
      ? {} #module.local_peering_gateways-list["local_peering_gateways-map"]
      : module.local_peering_gateways-create["local_peering_gateways-map"]
    ) : null
  ) 
}

output "local_peering_gateways-list" {
  depends_on                        = [
                                        module.compartments-create,
                                        module.compartments-list,
                                        module.local_peering_gateways-create #,
                                        #module.local_peering_gateways-list
  ]
  description                       = "display list of local_peering_gateways"
  value                             = (
    var.config.et["default"].infrastructure["local_peering_gateways"].outputs["list"].enable                    == true  ? (
      var.config.et[var.local.execution_target.name].infrastructure.modules["local_peering_gateways"].enable    == false ||
      var.config.et["default"].infrastructure.modules["local_peering_gateways"].enable                          == false
      ? {} #module.local_peering_gateways-list["local_peering_gateways-list"]
      : module.local_peering_gateways-create["local_peering_gateways-list"]
    ) : null
  )
}

output "local_peering_gateways-raw" {
  depends_on                        = [
                                        module.compartments-create,
                                        module.compartments-list,
                                        module.local_peering_gateways-create #,
                                        #module.local_peering_gateways-list
  ]
  description                       = "display raw output of local_peering_gateways"
  value                             = (
    var.config.et["default"].infrastructure["local_peering_gateways"].outputs["raw"].enable                     == true  ? (
      var.config.et[var.local.execution_target.name].infrastructure.modules["local_peering_gateways"].enable    == false ||
      var.config.et["default"].infrastructure.modules["local_peering_gateways"].enable                          == false
      ? {}
      : module.local_peering_gateways-create["local_peering_gateways-raw"]
    ) : null
  )
}