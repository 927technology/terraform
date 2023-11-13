output "subnets-map"                {
  depends_on                        = [
                                        module.compartments-create,
                                        module.compartments-list,
                                        module.vcns-create #,
                                        #module.vcns-list
  ]
  description                       = "display map of subnets"
  value                             = (
    var.config.et["default"].infrastructure["subnets"].outputs["map"].enable                    == true  ? (
      var.config.et[var.local.execution_target.name].infrastructure.modules["subnets"].enable   == false ||
      var.config.et["default"].infrastructure.modules["subnets"].enable                         == false
      ? {} #module.vcns-list["subnets-map"]
      : module.vcns-create["subnets-map"]
    ) : null
  ) 
}

output "subnets-list"               {
  depends_on                        = [
                                        module.compartments-create,
                                        module.compartments-list,
                                        module.vcns-create #,
                                        #module.vcns-list
  ]
  description                       = "display list of subnets"
  value                             = (
    var.config.et["default"].infrastructure["subnets"].outputs["list"].enable                   == true  ? (
      var.config.et[var.local.execution_target.name].infrastructure.modules["subnets"].enable   == false ||
      var.config.et["default"].infrastructure.modules["subnets"].enable                         == false
      ? {} #module.vcns-list["subnets-list"]
      : module.vcns-create["subnets-list"]
    ) : null
  )
}

output "subnets-raw"                {
  depends_on                        = [
                                        module.compartments-create,
                                        module.compartments-list,
                                        module.vcns-create #,
                                        #module.vcns-list
  ]
  description                       = "display raw output of subnets"
  value                             = (
    var.config.et["default"].infrastructure["subnets"].outputs["raw"].enable                    == true  ? (
      var.config.et[var.local.execution_target.name].infrastructure.modules["subnets"].enable   == false ||
      var.config.et["default"].infrastructure.modules["subnets"].enable                         == false
      ? {}
      : module.vcns-create["subnets-raw"]
    ) : null
  )
}

output "subnets-test"               {
  depends_on                        = [
                                        module.compartments-create,
                                        module.compartments-list,
                                        module.vcns-create #,
                                        #module.vcns-list
  ]
  description                       = "display test output of subnets"
  value                             = (
    var.config.et["default"].infrastructure["subnets"].outputs["test"].enable                   == true  ? (
      var.config.et[var.local.execution_target.name].infrastructure.modules["subnets"].enable   == false ||
      var.config.et["default"].infrastructure.modules["subnets"].enable                         == false
      ? {} #module.vcns-list["test"]
      : module.vcns-create["test"]
    ) : null
  )
}