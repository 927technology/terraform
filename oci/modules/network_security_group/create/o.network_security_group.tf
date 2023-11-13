
output "network_security_group-map" {
  depends_on                        = [
                                        oci_core_network_security_group.v0_1_0
  ]
  #value                             = oci_core_network_security_group.v0_1_0
  value                             = ({
    for rule_set in (
      flatten([
        for group in var.et_map.network_security_group : [
          for rule in group.rules : 
            {
              "rule" = rule
              "group" = {
                label = group.label 
                enable = group.enable 
              }
            }
        ]
      ])
    ) : "${rule_set.group.label}-${rule_set.rule.label}" => rule_set
  })
}



/*
output "network_security_group-list" {
    depends_on                      = [
                                        oci_core_network_security_group.v0_1_0
    ]
    value                           = oci_core_network_security_group.v0_1_0
}

output "network_security_group-raw" {
    depends_on                      = [
                                        oci_core_network_security_group.v0_1_0
    ]
    value                           = oci_core_network_security_group.v0_1_0
}
*/