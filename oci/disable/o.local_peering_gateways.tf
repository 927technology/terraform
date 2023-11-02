output "local_peering_gateways-list" {
  depends_on                        = [
                                        module.compartments-create,
                                        module.compartments-list,
                                        module.local_peering_gateways-create,
                                        module.local_peering_gateways-list,
                                        module.vcns-create,
                                        module.vcns-list
  ]
  value                             = (
    var.config.et["default"].infrastructure["local_peering_gateways"].outputs["list"].enable == true         ? (
      var.config.et[var.local.execution_target.name].infrastructure.modules["local_peering_gateways"].enable == false ||
      var.config.et["default"].infrastructure.modules["local_peering_gateways"].enable  == false
      ? module.local_peering_gateways-create["list"]
      : module.local_peering_gateways-list["list"]
    ) : null
  )
}

output "local_peering_gateways-map" {
  depends_on                        = [
                                        module.compartments-create,
                                        module.compartments-list,
                                        module.local_peering_gateways-create,
                                        module.local_peering_gateways-list,
                                        module.vcns-create,
                                        module.vcns-list
  ]
  value                             = (
    var.config.et["default"].infrastructure["local_peering_gateways"].outputs["map"].enable == true         ? (
      var.config.et[var.local.execution_target.name].infrastructure.modules["local_peering_gateways"].enable == false ||
      var.config.et["default"].infrastructure.modules["local_peering_gateways"].enable  == false
      ? module.local_peering_gateways-create["map"]
      : module.local_peering_gateways-list["map"]
    ) : null
  )
}

output "local_peering_gateways-raw" {
  depends_on                        = [
                                        module.compartments-create,
                                        module.compartments-list,
                                        module.local_peering_gateways-create,
                                        module.local_peering_gateways-list,
                                        module.vcns-create,
                                        module.vcns-list
  ]
  value                             = (
    var.config.et["default"].infrastructure["local_peering_gateways"].outputs["raw"].enable == true         ? (
      var.config.et[var.local.execution_target.name].infrastructure.modules["local_peering_gateways"].enable == false ||
      var.config.et["default"].infrastructure.modules["local_peering_gateways"].enable  == false
      ? module.local_peering_gateways-create["raw"]
      : module.local_peering_gateways-list["raw"]
    ) : null
  )
}

output "local_peering_gateways-test" {
  depends_on                        = [
                                        module.compartments-create,
                                        module.compartments-list,
                                        module.local_peering_gateways-create,
                                        module.local_peering_gateways-list,
                                        module.vcns-create,
                                        module.vcns-list
  ]
  value                             = (
    var.config.et["default"].infrastructure["local_peering_gateways"].outputs["test"].enable == true         ? (
      var.config.et[var.local.execution_target.name].infrastructure.modules["local_peering_gateways"].enable == false ||
      var.config.et["default"].infrastructure.modules["local_peering_gateways"].enable  == false
      ? module.local_peering_gateways-create["test"]
      : module.local_peering_gateways-list["test"]
    ) : null
  )
}