
output "network_security_rule-map" {
    depends_on                      = [
                                        oci_core_network_security_group_security_rule.v0_1_0-icmp,
                                        oci_core_network_security_group_security_rule.v0_1_0-icmpv6,
                                        oci_core_network_security_group_security_rule.v0_1_0-tcp,
                                        oci_core_network_security_group_security_rule.v0_1_0-udp
    ]
    value                           = (
        merge(
          oci_core_network_security_group_security_rule.v0_1_0-icmp,
          oci_core_network_security_group_security_rule.v0_1_0-icmpv6,
          oci_core_network_security_group_security_rule.v0_1_0-tcp,
          oci_core_network_security_group_security_rule.v0_1_0-udp
        )
    )
}

output "network_security_rule-list" {
    depends_on                      = [
                                        oci_core_network_security_group_security_rule.v0_1_0-icmp,
                                        oci_core_network_security_group_security_rule.v0_1_0-icmpv6,
                                        oci_core_network_security_group_security_rule.v0_1_0-tcp,
                                        oci_core_network_security_group_security_rule.v0_1_0-udp
    ]
    value                           = (
        merge(
          oci_core_network_security_group_security_rule.v0_1_0-icmp,
          oci_core_network_security_group_security_rule.v0_1_0-icmpv6,
          oci_core_network_security_group_security_rule.v0_1_0-tcp,
          oci_core_network_security_group_security_rule.v0_1_0-udp
        )
    )
}

output "network_security_rule-raw" {
    depends_on                      = [
                                        oci_core_network_security_group_security_rule.v0_1_0-icmp,
                                        oci_core_network_security_group_security_rule.v0_1_0-icmpv6,
                                        oci_core_network_security_group_security_rule.v0_1_0-tcp,
                                        oci_core_network_security_group_security_rule.v0_1_0-udp
    ]
    value                           = (
        merge(
          oci_core_network_security_group_security_rule.v0_1_0-icmp,
          oci_core_network_security_group_security_rule.v0_1_0-icmpv6,
          oci_core_network_security_group_security_rule.v0_1_0-tcp,
          oci_core_network_security_group_security_rule.v0_1_0-udp
        )
    )
}