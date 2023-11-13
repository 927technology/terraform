output "subnets-list" {
  depends_on                        = [
                                        module.compartments-create,
                                        module.compartments-list,
                                        module.subnets-create,
                                        module.subnets-list,
                                        module.vcns-create,
                                        module.vcns-list
  ]
  value                             = (
    var.config.et["default"].infrastructure["subnets"].outputs["list"].enable == true         ? (
      var.config.et[var.local.execution_target.name].infrastructure.modules["subnets"].enable == false ||
      var.config.et["default"].infrastructure.modules["subnets"].enable  == false
      ? module.subnets-create["list"]
      : module.subnets-list["list"]
    ) : null
  )
}

output "subnets-map" {
  depends_on                        = [
                                        module.compartments-create,
                                        module.compartments-list,
                                        module.subnets-create,
                                        module.subnets-list,
                                        module.vcns-create,
                                        module.vcns-list
  ]
  value                             = (
    var.config.et["default"].infrastructure["subnets"].outputs["map"].enable == true         ? (
      var.config.et[var.local.execution_target.name].infrastructure.modules["subnets"].enable == false ||
      var.config.et["default"].infrastructure.modules["subnets"].enable  == false
      ? module.subnets-list["map"]
      : module.subnets-create["map"]
    ) : null
  )
}

output "subnets-raw" {
  depends_on                        = [
                                        module.compartments-create,
                                        module.compartments-list,
                                        module.subnets-create,
                                        module.subnets-list,
                                        module.vcns-create,
                                        module.vcns-list
  ]
  value                             = (
    var.config.et["default"].infrastructure["subnets"].outputs["raw"].enable == true         ? (
      var.config.et[var.local.execution_target.name].infrastructure.modules["subnets"].enable == false ||
      var.config.et["default"].infrastructure.modules["subnets"].enable  == false
      ? module.subnets-create["raw"]
      : module.subnets-list["raw"]
    ) : null
  )
}

output "subnets-test" {
  depends_on                        = [
                                        module.compartments-create,
                                        module.compartments-list,
                                        module.subnets-create,
                                        module.subnets-list,
                                        module.vcns-create,
                                        module.vcns-list
  ]
  value                             = (
    var.config.et["default"].infrastructure["subnets"].outputs["test"].enable == true         ? (
      var.config.et[var.local.execution_target.name].infrastructure.modules["subnets"].enable == false ||
      var.config.et["default"].infrastructure.modules["subnets"].enable  == false
      ? module.subnets-create["test"]
      : module.subnets-list["test"]
    ) : null
  )
}