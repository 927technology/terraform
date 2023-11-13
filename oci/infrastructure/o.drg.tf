output "drg-map"                {
  depends_on                        = [
                                        module.compartments-create,
                                        module.compartments-list
  ]
  description                       = "display map of drg"
  value                             = (
    var.config.et["default"].infrastructure["drg"].outputs["map"].enable                    == true  ? (
      var.config.et[var.local.execution_target.name].infrastructure.modules["drg"].enable   == false ||
      var.config.et["default"].infrastructure.modules["drg"].enable                         == false
      ? {} #module.drg-list["drg-map"]
      : module.drg-create["drg-map"]
    ) : null
  ) 
}

output "drg-list"               {
  depends_on                        = [
                                        module.compartments-create,
                                        module.compartments-list
  ]
  description                       = "display list of drg"
  value                             = (
    var.config.et["default"].infrastructure["drg"].outputs["list"].enable                   == true  ? (
      var.config.et[var.local.execution_target.name].infrastructure.modules["drg"].enable   == false ||
      var.config.et["default"].infrastructure.modules["drg"].enable                         == false
      ? {} #module.drg-list["drg-list"]
      : module.drg-create["drg-list"]
    ) : null
  )
}

output "drg-raw"                {
  depends_on                        = [
                                        module.compartments-create,
                                        module.compartments-list
  ]
  description                       = "display raw output of drg"
  value                             = (
    var.config.et["default"].infrastructure["drg"].outputs["raw"].enable                    == true  ? (
      var.config.et[var.local.execution_target.name].infrastructure.modules["drg"].enable   == false ||
      var.config.et["default"].infrastructure.modules["drg"].enable                         == false
      ? {}
      : module.drg-create["drg-raw"]
    ) : null
  )
}