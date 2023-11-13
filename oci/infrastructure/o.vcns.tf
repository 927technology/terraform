output "vcns-map"                   {
  depends_on                        = [
                                        module.compartments-create,
                                        module.compartments-list,
                                        module.vcns-create #,
                                        #module.vcns-list
  ]
  description                       = "display map of vcns"
  value                             = (
    var.config.et["default"].infrastructure["vcns"].outputs["map"].enable                   == true  ? (
      var.config.et[var.local.execution_target.name].infrastructure.modules["vcns"].enable  == false ||
      var.config.et["default"].infrastructure.modules["vcns"].enable                        == false
      ? {} #module.vcns-list["vcns-map"]  #inconsistant output types needs work
      : module.vcns-create["vcns-map"]
    ) : null
  ) 
}

output "vcns-list"                  {
  depends_on                        = [
                                        module.compartments-create,
                                        module.compartments-list,
                                        module.vcns-create #,
                                        #module.vcns-list
  ]
  description                       = "display list of vcns"
  value                             = (
    var.config.et["default"].infrastructure["vcns"].outputs["list"].enable                  == true  ? (
      var.config.et[var.local.execution_target.name].infrastructure.modules["vcns"].enable  == false ||
      var.config.et["default"].infrastructure.modules["vcns"].enable                        == false
      ? {} #module.vcns-list["vcns-list"]
      : module.vcns-create["vcns-list"]
    ) : null
  )
}

output "vcns-raw"                   {
  depends_on                        = [
                                        module.compartments-create,
                                        module.compartments-list,
                                        module.vcns-create #,
                                        #module.vcns-list
  ]
  description                       = "display raw output of vcns"
  value                             = (
    var.config.et["default"].infrastructure["vcns"].outputs["raw"].enable                   == true  ? (
      var.config.et[var.local.execution_target.name].infrastructure.modules["vcns"].enable  == false ||
      var.config.et["default"].infrastructure.modules["vcns"].enable                        == false
      ? {}
      : module.vcns-create["vcns-raw"]
    ) : null
  )
}

output "vcns-test"                  {
  depends_on                        = [
                                        module.compartments-create,
                                        module.compartments-list,
                                        module.vcns-create #,
                                        #module.vcns-list
  ]
  description                       = "display test output of vcns"
  value                             = (
    var.config.et["default"].infrastructure["vcns"].outputs["test"].enable                  == true  ? (
      var.config.et[var.local.execution_target.name].infrastructure.modules["vcns"].enable  == false ||
      var.config.et["default"].infrastructure.modules["vcns"].enable                        == false
      ? {} #module.vcns-list["test"]
      : module.vcns-create["test"]
    ) : null
  )
}