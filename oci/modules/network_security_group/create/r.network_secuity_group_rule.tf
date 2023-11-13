resource "oci_core_network_security_group_security_rule" "v0_1_0-icmp" {
  for_each                          = ({
    for rule_set in (
      flatten([
        for group in var.et_map.network_security_group : [
          for rule in group.rules : 
            {
              "group"               = {
                label               = group.label 
                enable              = group.enable 
              }
              "rule"                = rule
            }
        ]
      ])
    ) : "${rule_set.group.label}-${rule_set.rule.label}" => rule_set
 
    if  (
      # test protocol type
      ( try(
          lower(rule_set.rule.protocol.type) , false 
        ) == "icmp"
      )                                                               == true             &&        #protocol type is icmp          
      
      # all other tests
      rule_set.rule.enable                                            == true             &&        #is the et module enabled
      
      rule_set.group.enable                                           == true             &&        #is the et nsg enabled

      var.default_map.modules["network_security_group"].enable        == true             &&        #default network_security_rule module enabled

      var.et_map.modules["network_security_group"].enable             == true             &&        #et network_security_rule module enabled
    
      ( var.default_map.modules["network_security_group"].version     == "0.1.0"          ||        #is the et module version 0.1.0 OR
        ( var.default_map.modules["network_security_group"].version   == null             &&        #is the et module version null AND
          var.et_map.modules["network_security_group"].version        == "0.1.0"                    #is the default module version 0.1.0
        )
      )
    ) 
  })

  depends_on                        = [
                                        oci_core_network_security_group.v0_1_0
  ]
  
  description                       = each.value.rule.description

  destination                       = (
      lower(each.value.rule.destination.type)                         == "cidr_block"     ? (
      "${each.value.rule.destination.cidr.subnet}/${each.value.rule.destination.cidr.prefix}"
    ) : (
      lower(each.value.rule.destination.type)                         == "service_cidr_block" ? (
      "${each.value.rule.destination.cidr.subnet}/${each.value.rule.destination.cidr.prefix}"
    ) : (
      lower(each.value.rule.destination.type)                         == "network_security_group" ? (
      oci_core_network_security_group.v0_1_0[each.value.rule.network_security_group.label].id
    ) : (
                                                                                                    #yup you screwed up!
      "you should not see this"
    ))))

  destination_type                  = lower(each.value.rule.destination.type)  
  
  direction                         = lower(each.value.rule.direction)  

  icmp_options {
    code                            = (
      # test icmp code
      ( try(
          each.value.rule.protocol.icmp.code , false 
        ) != null
      )                                                               == true             &&        #icmp code is present
      ( try(
          each.value.rule.protocol.icmp.code , -1
        ) >= 0
      )                                                               == true             ? (       #icmp code is a positive number
        each.value.rule.protocol.icmp.code
      ) : (
        "all"
      )
    )

    type                            = (
      # test icmp code
      ( try(
          each.value.rule.protocol.icmp.type , false 
        ) != null
      )                                                               == true             &&        #icmp type is present
      ( try(
          each.value.rule.protocol.icmp.type , -1
        ) >= 0
      )                                                               == true             ? (       #icmp type is a positive number
        each.value.rule.protocol.icmp.type
      ) : (
        "all"
      )
    )
  }

  protocol                          = 1
  
  network_security_group_id         = oci_core_network_security_group.v0_1_0[each.key].id
  
  source                            = (
      lower(each.value.rule.source.type)                              == "cidr_block"           ? (
      "${each.value.rule.source.cidr.subnet}/${each.value.rule.source.cidr.prefix}"
    ) : (
      lower(each.value.rule.source.type)                              == "service_cidr_block"   ? (
      "${each.value.rule.source.cidr.subnet}/${each.value.rule.source.cidr.prefix}"
    ) : (
      lower(each.value.rule.source.type)                              == "network_security_group" ? (
      oci_core_network_security_group.v0_1_0[each.value.rule.network_security_group.label].id
    ) : (
                                                                                                    #yup you screwed up!
      "you should not see this"
    ))))

  source_type                       = lower(each.value.rule.source.type)  
  
  stateless                         = each.value.rule.stateless
}

resource "oci_core_network_security_group_security_rule" "v0_1_0-icmpv6" {
  for_each                          = ({
    for rule_set in (
      flatten([
        for group in var.et_map.network_security_group : [
          for rule in group.rules : 
            {
              "group"               = {
                label               = group.label 
                enable              = group.enable 
              }
              "rule"                = rule
            }
        ]
      ])
    ) : "${rule_set.group.label}-${rule_set.rule.label}" => rule_set
 
    if  (
      # test protocol type
      ( try(
          lower(rule_set.rule.protocol.type) , false 
        ) == "icmpv6"
      )                                                               == true             &&        #protocol type is icmp          
      
      # all other tests
      rule_set.rule.enable                                            == true             &&        #is the et module enabled
      
      rule_set.group.enable                                           == true             &&        #is the et nsg enabled

      var.default_map.modules["network_security_group"].enable        == true             &&        #default network_security_rule module enabled

      var.et_map.modules["network_security_group"].enable             == true             &&        #et network_security_rule module enabled
    
      ( var.default_map.modules["network_security_group"].version     == "0.1.0"          ||        #is the et module version 0.1.0 OR
        ( var.default_map.modules["network_security_group"].version   == null             &&        #is the et module version null AND
          var.et_map.modules["network_security_group"].version        == "0.1.0"                    #is the default module version 0.1.0
        )
      )
    ) 
  })

  depends_on                        = [
                                        oci_core_network_security_group.v0_1_0
  ]
  
  description                       = each.value.rule.description

  destination                       = (
      lower(each.value.rule.destination.type)                         == "cidr_block"     ? (
      "${each.value.rule.destination.cidr.subnet}/${each.value.rule.destination.cidr.prefix}"
    ) : (
      lower(each.value.rule.destination.type)                         == "service_cidr_block" ? (
      "${each.value.rule.destination.cidr.subnet}/${each.value.rule.destination.cidr.prefix}"
    ) : (
      lower(each.value.rule.destination.type)                         == "network_security_group" ? (
      oci_core_network_security_group.v0_1_0[each.value.rule.network_security_group.label].id
    ) : (
                                                                                                    #yup you screwed up!
      "you should not see this"
    ))))

  destination_type                  = lower(each.value.rule.destination.type)  
  
  direction                         = lower(each.value.rule.direction)  

  icmp_options {
    code                            = (
      # test icmp code
      ( try(
          each.value.rule.protocol.icmp.code , false 
        ) != null
      )                                                               == true             &&        #icmp code is present
      ( try(
          each.value.rule.protocol.icmp.code , -1
        ) >= 0
      )                                                               == true             ? (       #icmp code is a positive number
        each.value.rule.protocol.icmp.code
      ) : (
        "all"
      )
    )

    type                            = (
      # test icmp code
      ( try(
          each.value.rule.protocol.icmp.type , false 
        ) != null
      )                                                               == true             &&        #icmp type is present
      ( try(
          each.value.rule.protocol.icmp.type , -1
        ) >= 0
      )                                                               == true             ? (       #icmp type is a positive number
        each.value.rule.protocol.icmp.type
      ) : (
        "all"
      )
    )
  }

  protocol                          = 58
  
  network_security_group_id         = oci_core_network_security_group.v0_1_0[each.key].id
  
  source                            = (
      lower(each.value.rule.source.type)                              == "cidr_block"           ? (
      "${each.value.rule.source.cidr.subnet}/${each.value.rule.source.cidr.prefix}"
    ) : (
      lower(each.value.rule.source.type)                              == "service_cidr_block"   ? (
      "${each.value.rule.source.cidr.subnet}/${each.value.rule.source.cidr.prefix}"
    ) : (
      lower(each.value.rule.source.type)                              == "network_security_group" ? (
      oci_core_network_security_group.v0_1_0[each.value.rule.network_security_group.label].id
    ) : (
                                                                                                    #yup you screwed up!
      "you should not see this"
    ))))

  source_type                       = lower(each.value.rule.source.type)  
  
  stateless                         = each.value.rule.stateless
}

resource "oci_core_network_security_group_security_rule" "v0_1_0-tcp" {
  for_each                          = ({
    for rule_set in (
      flatten([
        for group in var.et_map.network_security_group : [
          for rule in group.rules : 
            {
              "group"               = {
                label               = group.label 
                enable              = group.enable 
              }
              "rule"                = rule
            }
        ]
      ])
    ) : "${rule_set.group.label}-${rule_set.rule.label}" => rule_set

    if  (
      # test protocol type
      ( try(
          lower(rule_set.rule.protocol.type) , false 
        ) == "tcp"
      )
                                                                      == true             &&        #protocol type is tcp         
      # test destination/source type
      ( try(
          rule_set.rule.destination.type , false 
        ) != null
      )                                                               == true             &&        #destination port type is present
      ( try(
          rule_set.rule.source.type , false 
        ) != null
      )                                                               == true             &&        #source port type is present

      # test destination/source port max/min
      ## destination
      ( try(
          rule_set.rule.destination.port.max , false 
        ) != null
      )                                                               == true             &&        #destination port max is present
      ( try(
          rule_set.rule.destination.port.max , false 
        ) > 0
      )                                                               == true             &&        #destination port max is greater than 0, not string

      ( try(
          rule_set.rule.destination.port.min , false 
        ) != null
      )                                                               == true             &&        #destination port min is present
      ( try(
          rule_set.rule.destination.port.max , false 
        ) > 0
      )                                                               == true             &&        #destination port min is greater than 0, not string
      
      ## source
      ( try(
          rule_set.rule.source.port.max , false 
        ) != null
      )                                                               == true             &&        #source port max is present
      

      ( try(
          rule_set.rule.source.port.max , false 
        ) > 0
      )                                                               == true             &&        #source port max is greater than 0, not string

      ( try(
          rule_set.rule.source.port.min , false 
        ) != null
      )                                                               == true             &&        #source port min is present
      
      ( try(
          rule_set.rule.source.port.min , false 
        ) > 0
      )                                                               == true             &&        #source port is greater than 0, not string

      # all other tests
      rule_set.rule.enable                                            == true             &&        #is the et module enabled
      
      rule_set.group.enable                                           == true             &&        #is the et nsg enabled

      var.default_map.modules["network_security_group"].enable        == true             &&        #default network_security_rule module enabled

      var.et_map.modules["network_security_group"].enable             == true             &&        #et network_security_rule module enabled
    
      ( var.default_map.modules["network_security_group"].version     == "0.1.0"          ||        #is the et module version 0.1.0 OR
        ( var.default_map.modules["network_security_group"].version   == null             &&        #is the et module version null AND
          var.et_map.modules["network_security_group"].version        == "0.1.0"                    #is the default module version 0.1.0
        )
      ) 
    )
  })

  depends_on                        = [
                                        oci_core_network_security_group.v0_1_0
  ]

  description                       = each.value.rule.description

  destination                       = (
      lower(each.value.rule.destination.type)                         == "cidr_block"     ? (
      "${each.value.rule.destination.cidr.subnet}/${each.value.rule.destination.cidr.prefix}"
    ) : (
      lower(each.value.rule.destination.type)                         == "service_cidr_block" ? (
      "${each.value.rule.destination.cidr.subnet}/${each.value.rule.destination.cidr.prefix}"
    ) : (
      lower(each.value.rule.destination.type)                         == "network_security_group" ? (
      oci_core_network_security_group.v0_1_0[each.value.rule.network_security_group.label].id
    ) : (
                                                                                                    #yup you screwed up!
      "you should not see this"
    ))))

  destination_type                  = upper(each.value.rule.destination.type)  
  
  direction                         = upper(each.value.rule.direction)    

  protocol                          = 6
  
  network_security_group_id         = oci_core_network_security_group.v0_1_0[each.value.group.label].id
  
  source                            = (
      lower(each.value.rule.source.type)                              == "cidr_block"     ? (
      "${each.value.rule.source.cidr.subnet}/${each.value.rule.source.cidr.prefix}"
    ) : (
      lower(each.value.rule.source.type)                              == "service_cidr_block" ? (
      "${each.value.rule.source.cidr.subnet}/${each.value.rule.source.cidr.prefix}"
    ) : (
      lower(each.value.rule.source.type)                              == "network_security_group" ? (
      oci_core_network_security_group.v0_1_0[each.value.rule.network_security_group.label].id
    ) : (
                                                                                                    #yup you screwed up!
      "you should not see this"
    ))))
  
  source_type                       = upper(each.value.rule.source.type)  
  
  stateless                         = each.value.rule.stateless

  tcp_options {
    destination_port_range {
      max                           = each.value.rule.destination.port.max
      min                           = each.value.rule.destination.port.min
    }
    source_port_range {
      max                           = each.value.rule.source.port.max
      min                           = each.value.rule.source.port.min
    }
  }
}

resource "oci_core_network_security_group_security_rule" "v0_1_0-udp" {
  for_each                          = ({
    for rule_set in (
      flatten([
        for group in var.et_map.network_security_group : [
          for rule in group.rules : 
            {
              "group"               = {
                label               = group.label 
                enable              = group.enable 
              }
              "rule"                = rule
            }
        ]
      ])
    ) : "${rule_set.group.label}-${rule_set.rule.label}" => rule_set

    if  (
      # test protocol type
      ( try(
          lower(rule_set.rule.protocol.type) , false 
        ) == "udp"
      )
                                                                      == true             &&        #protocol type is tcp         
      # test destination/source type
      ( try(
          rule_set.rule.destination.type , false 
        ) != null
      )                                                               == true             &&        #destination port type is present
      ( try(
          rule_set.rule.source.type , false 
        ) != null
      )                                                               == true             &&        #source port type is present

      # test destination/source port max/min
      ## destination
      ( try(
          rule_set.rule.destination.port.max , false 
        ) != null
      )                                                               == true             &&        #destination port max is present
      ( try(
          rule_set.rule.destination.port.max , false 
        ) > 0
      )                                                               == true             &&        #destination port max is greater than 0, not string

      ( try(
          rule_set.rule.destination.port.min , false 
        ) != null
      )                                                               == true             &&        #destination port min is present
      ( try(
          rule_set.rule.destination.port.max , false 
        ) > 0
      )                                                               == true             &&        #destination port min is greater than 0, not string
      
      ## source
      ( try(
          rule_set.rule.source.port.max , false 
        ) != null
      )                                                               == true             &&        #source port max is present
      

      ( try(
          rule_set.rule.source.port.max , false 
        ) > 0
      )                                                               == true             &&        #source port max is greater than 0, not string

      ( try(
          rule_set.rule.source.port.min , false 
        ) != null
      )                                                               == true             &&        #source port min is present
      
      ( try(
          rule_set.rule.source.port.min , false 
        ) > 0
      )                                                               == true             &&        #source port is greater than 0, not string

      # all other tests
      rule_set.rule.enable                                            == true             &&        #is the et module enabled
      
      rule_set.group.enable                                           == true             &&        #is the et nsg enabled

      var.default_map.modules["network_security_group"].enable        == true             &&        #default network_security_rule module enabled

      var.et_map.modules["network_security_group"].enable             == true             &&        #et network_security_rule module enabled
    
      ( var.default_map.modules["network_security_group"].version     == "0.1.0"          ||        #is the et module version 0.1.0 OR
        ( var.default_map.modules["network_security_group"].version   == null             &&        #is the et module version null AND
          var.et_map.modules["network_security_group"].version        == "0.1.0"                    #is the default module version 0.1.0
        )
      ) 
    )
  })

  depends_on                        = [
                                        oci_core_network_security_group.v0_1_0
  ]

  description                       = each.value.rule.description

  destination                       = (
      lower(each.value.rule.destination.type)                         == "cidr_block"     ? (
      "${each.value.rule.destination.cidr.subnet}/${each.value.rule.destination.cidr.prefix}"
    ) : (
      lower(each.value.rule.destination.type)                         == "service_cidr_block" ? (
      "${each.value.rule.destination.cidr.subnet}/${each.value.rule.destination.cidr.prefix}"
    ) : (
      lower(each.value.rule.destination.type)                         == "network_security_group" ? (
      oci_core_network_security_group.v0_1_0[each.value.rule.network_security_group.label].id
    ) : (
                                                                                                    #yup you screwed up!
      "you should not see this"
    ))))

  destination_type                  = upper(each.value.rule.destination.type)  
  
  direction                         = upper(each.value.rule.direction)    

  protocol                          = 17
  
  network_security_group_id         = oci_core_network_security_group.v0_1_0[each.value.group.label].id
  
  source                            = (
      lower(each.value.rule.source.type)                              == "cidr_block"     ? (
      "${each.value.rule.source.cidr.subnet}/${each.value.rule.source.cidr.prefix}"
    ) : (
      lower(each.value.rule.source.type)                              == "service_cidr_block" ? (
      "${each.value.rule.source.cidr.subnet}/${each.value.rule.source.cidr.prefix}"
    ) : (
      lower(each.value.rule.source.type)                              == "network_security_group" ? (
      oci_core_network_security_group.v0_1_0[each.value.rule.network_security_group.label].id
    ) : (
                                                                                                    #yup you screwed up!
      "you should not see this"
    ))))
  
  source_type                       = upper(each.value.rule.source.type)  
  
  stateless                         = each.value.rule.stateless

  udp_options {
    destination_port_range {
      max                           = each.value.rule.destination.port.max
      min                           = each.value.rule.destination.port.min
    }
    source_port_range {
      max                           = each.value.rule.source.port.max
      min                           = each.value.rule.source.port.min
    }
  }
}