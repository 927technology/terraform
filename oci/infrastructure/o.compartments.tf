output "compartments-list"          {
  depends_on                        = [
                                        module.compartments-create,
                                        module.compartments-list
  ]
  description                       = "display list of compartments"
  value                             = (
    var.config.et["default"].infrastructure["compartments"].outputs["list"].enable                  == true   ? (
      var.config.et[var.local.execution_target.name].infrastructure.modules["compartments"].enable  == false ||
      var.config.et["default"].infrastructure.modules["compartments"].enable                        == false
      ? module.compartments-create["list"]
      : module.compartments-list["list"]
    ) : null
  ) 
}

output "compartments-map"           {
  depends_on                        = [
                                        module.compartments-create,
                                        module.compartments-list
  ]
  description                       = "display map of compartments"
  value                             = (
    var.config.et["default"].infrastructure["compartments"].outputs["map"].enable                   == true  ? (
      var.config.et[var.local.execution_target.name].infrastructure.modules["compartments"].enable  == false ||
      var.config.et["default"].infrastructure.modules["compartments"].enable                        == false
      ? module.compartments-list["map"]
      : module.compartments-create["map"]
    ) : null
  ) 
}

output "compartments-raw"           {
  depends_on                        = [
                                        module.compartments-create,
                                        module.compartments-list
  ]
  description                       = "display raw output of compartments"
  value                             = (
    var.config.et["default"].infrastructure["compartments"].outputs["raw"].enable                   == true  ? (
      var.config.et[var.local.execution_target.name].infrastructure.modules["compartments"].enable  == false ||
      var.config.et["default"].infrastructure.modules["compartments"].enable                        == false
      ? module.compartments-list["raw"]
      : module.compartments-create["raw"]
    ) : null
  ) 
}

output "compartments-test"           {
  depends_on                        = [
                                        module.compartments-create,
                                        module.compartments-list
  ]
  description                       = "display test output of compartments"
  value                             = (
    var.config.et["default"].infrastructure["compartments"].outputs["test"].enable                  == true  ? (
      var.config.et[var.local.execution_target.name].infrastructure.modules["compartments"].enable  == false ||
      var.config.et["default"].infrastructure.modules["compartments"].enable                        == false
      ? module.compartments-list["test"]
      : module.compartments-create["test"]
    ) : null
  ) 
}


output "compartment_list-d0"        {
  depends_on                        = [
                                        module.compartments-create
  ]
  description                       = "display a map of existing compartments at d0 cycle.  this includes all levels already known in the infrastructure."
  value                             = (
    var.config.et["default"].infrastructure["compartments"].outputs["test"].enable                  == true  ? (
      var.config.et[var.local.execution_target.name].infrastructure.modules["compartments"].enable  == false ||
      var.config.et["default"].infrastructure.modules["compartments"].enable                        == false
      ? null
      : module.compartments-create.list-d0
    ) : null
  ) 
}

output "compartment_list-d1"        {
  depends_on                        = [
                                        module.compartments-create
  ]
  description                       = "display a map of existing compartments at d1 cycle.  this includes all levels already known in the infrastructure."
  value                             = (
    var.config.et["default"].infrastructure["compartments"].outputs["test"].enable                  == true  ? (
      var.config.et[var.local.execution_target.name].infrastructure.modules["compartments"].enable  == false ||
      var.config.et["default"].infrastructure.modules["compartments"].enable                        == false
      ? null
      : module.compartments-create.list-d1
    ) : null
  ) 
}

output "compartment_list-d2"        {
  depends_on                        = [
                                        module.compartments-create
  ]
  description                       = "display a map of existing compartments at d2 cycle.  this includes all levels already known in the infrastructure."
  value                             = (
    var.config.et["default"].infrastructure["compartments"].outputs["test"].enable                  == true  ? (
      var.config.et[var.local.execution_target.name].infrastructure.modules["compartments"].enable  == false ||
      var.config.et["default"].infrastructure.modules["compartments"].enable                        == false
      ? null
      : module.compartments-create.list-d2
    ) : null
  ) 
}

output "compartment_list-d3"        {
  depends_on                        = [
                                        module.compartments-create
  ]
  description                       = "display a map of existing compartments at d3 cycle.  this includes all levels already known in the infrastructure."
  value                             = (
    var.config.et["default"].infrastructure["compartments"].outputs["test"].enable                  == true  ? (
      var.config.et[var.local.execution_target.name].infrastructure.modules["compartments"].enable  == false ||
      var.config.et["default"].infrastructure.modules["compartments"].enable                        == false
      ? null
      : module.compartments-create.list-d3
    ) : null
  ) 
}

output "compartment_list-d4"        {
  depends_on                        = [
                                        module.compartments-create
  ]
  description                       = "display a map of existing compartments at d4 cycle.  this includes all levels already known in the infrastructure."
  value                             = (
    var.config.et["default"].infrastructure["compartments"].outputs["test"].enable                  == true  ? (
      var.config.et[var.local.execution_target.name].infrastructure.modules["compartments"].enable  == false ||
      var.config.et["default"].infrastructure.modules["compartments"].enable                        == false
      ? null
      : module.compartments-create.list-d4
    ) : null
  ) 
}