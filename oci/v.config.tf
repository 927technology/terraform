variable "config" {
  type                              = map
  default                           = {
    et                              = {
      cmurray                       = {
        application                 = {}
        infrastructure              = {
          compartments              = [
            /*
            {
              description           = "idcs-"
              enable                = true
              enable_delete         = false
              parent                = "root"
              tags                  = {
                defined             = {}
                freeform            = {}
              }
            },
            */
            { #/shared
              depth                 = 1
              description           = "/shared"
              enable                = true
              enable_delete         = true
              label                 = "shared"
              name                  = "shared"
              parent                = "root"
              prefix                = []
              suffix                = []
            },
            { #/shared/network
              depth                 = 2
              description           = "/shared/network"
              enable                = true
              enable_delete         = true
              name                  = "network"
              label                 = "shared-network"
              parent                = "shared"
              prefix                = []
              suffix                = []
              tags                  = {
                defined             = {}
                freeform            = {}
              }
            },           
            { #/shared/network/lpg
              depth                 = 3
              description           = "/shared/network/lpg"
              enable                = false
              enable_delete         = true
              name                  = "lpg"
              label                 = "shared-network-lpg"
              parent                = "shared-network"
              prefix                = []
              suffix                = []
              tags                  = {
                defined             = {}
                freeform            = {}
              }
            },
            { #/uae
              depth                 = 1
              description           = "/uae"
              enable                = true
              enable_delete         = true
              name                  = "uae"
              label                 = "uae"
              parent                = "root"
              prefix                = []
              suffix                = []
              tags                  = {
                defined             = {}
                freeform            = {}
              }
            },
            { #/uae/network
              depth                 = 2
              description           = "/uae/network"
              enable                = true
              enable_delete         = true
              name                  = "network"
              label                 = "uae-network"
              parent                = "uae"
              prefix                = []
              suffix                = []
              tags                  = {
                defined             = {}
                freeform            = {}
              }
            },
            { #/uae/application
              depth                 = 2
              description           = "/uae/application"
              enable                = true
              enable_delete         = true
              name                  = "application"
              label                 = "uae-application"
              parent                = "uae"
              prefix                = []
              suffix                = []
              tags                  = {
                defined             = {}
                freeform            = {}
              }
            }
          ]
          drg                       = [
            {
              compartment           = "shared-network"
              enable                = true
              label                 = "core"
              name                  = "core"
              prefix                = []
              suffix                = []
              tags                  = {
                defined             = {}
                freeform            = {}
              }
            }
          ]
          groups                    = [
            {
              compartment           = "root"
              description           = "first test group"
              enable                = true
              members               = {
                groups              = []
                users               = [
                                        "test1",
                                        "test2"
                ]
              }
              tags                  = {
                defined             = {}
                freeform            = {
                                        "label": "1st.test_group"

                }
              }
            },
            {
              compartment           = "root"
              description           = "second test group"
              enable                = true
              tags                  = {
                defined             = {}
                freeform            = {
                                        "label": "2nd.test_group"                  
                }
              }
            },
            {
              compartment           = "root"
              description           = "all test group"
              enable                = true
              tags                  = {
                defined             = {}
                freeform            = {
                                        "label": "all.test_group"
                }
              }
            }
          ]
          internet_gateway          = [
            {
              active                = false
              compartment           = "shared-network"
              enable                = true
              label                 = "internet"
              name                  = "internet"
              prefix                = []
              route_table           = {
                label               = null
              }
              suffix                = []
              tags                  = {
                defined             = {}
                freeform            = {}
              }
              vcn                   = {
                compartment         = "shared-network"
                label               = "tenancy"
              }
            }
          ]
          local_peering_gateways    = [
            {
              compartment           = "shared-network"
              enable                = true
              label                 = "tenancy"
              name                  = "tenancy"
              
              prefix                = []
              #route_table           = null
              tags                  = {
                defined             = {}
                freeform            = {}
              }
              suffix                = []
              vcn                   = {
                compartment         = "shared-network"
                label               = "tenancy"
                peer                = {
                  compartment       = "uae-network"
                  primary           = true                                                          #lpgs should only be initiated from one side.  
                                                                                                    #each lpg should have one end as primary and 
                                                                                                    #other not.
                  label             = "uae"
                }
              }
            },
            {
              compartment           = "uae-network"
              enable                = true
              label                 = "uae"
              name                  = "uae"
              prefix                = []
              #route_table           = null
              tags                  = {
                defined             = {}
                freeform            = {}
              }
              suffix                = []
              vcn                   = {
                compartment         = "uae-network"
                label               = "uae"
                peer                = {
                  compartment       = "shared-network"
                  primary           = false                                                         #lpgs should only be initiated from one side.  
                                                                                                    #each lpg should have one end as primary and 
                                                                                                    #other not.
                  label             = "tenancy"
                }
              }
            }
          ]
          modules                   = {
            compartments            = {
              enable                = true
              version               = null
            }
            drg                     = {
              enable                = true
              version               = null
            }
            groupmemberships        = {
              enable                = false
              version               = null
            }
            groups                  = {
              enable                = false
              version               = null
            }
            internet_gateway        = {
              enable                = true
              version               = null
            }
            local_peering_gateways  = {
              enable                = true
              version               = null
            }
            nat_gateway             = {
              enable                = true
              version               = null
            }
            network_security_group  = {
              enable                = true
              version               = null
            }
            route_table             = {
              enable                = true
              version               = null
            }
            service_gateway         = {
              enable                = true
              version               = null
            }
            subnets                 = {
              enable                = true
              version               = null
            }
            users                   = {
              enable                = false
              version               = null
            }
            vcns                    = {
              enable                = true
              version               = null
            }
            vlans                   = {
              enable                = false
              version               = null
            }
          }
          nat_gateway               = [
            {
              active                = false
              compartment           = "shared-network"
              enable                = false
              label                 = "nat1"
              name                  = "nat1"
              prefix                = []
              public_ip             = {
                label               = null
              }
              suffix                = []
              tags                  = {
                defined             = {}
                freeform            = {}
              }
              vcn                   = {
                compartment         = "shared-network"
                label               = "tenancy"
              }
            }
          ]
          network_security_group    = [
            {
              compartment           = "shared-network"
              enable                = true
              label                 = "test"
              name                  = "test"
              prefix                = []
              rules                 = [
                {
                  description       = "Inbound SSH"
                  destination       = {                                                             # select either cidr or network_security_group, default is cidr
                    cidr            = {
                      subnet        = "0.0.0.0"
                      prefix        = "0"
                    }
                    network_security_group = {
                      label         = null
                    }
                    port            = {
                      max           = "22"
                      min           = "22"
                    }
                    type            = "CIDR_BLOCK"                                                  # CIDR_BLOCK, SERVICE_CIDR_BLOCK, or NETWORK_SECURITY_GROUP
                  }
                  direction         = "INGRESS"
                  enable            = true
                  label             = "ssh"
                  source            = {
                    cidr            = {
                      subnet        = "0.0.0.0"
                      prefix        = "0"
                    }
                    network_security_group = {
                      label         = null
                    }
                    port            = {
                      max           = "22"
                      min           = "22"
                    }
                    type            = "CIDR_BLOCK"                                                  # CIDR_BLOCK, SERVICE_CIDR_BLOCK, and NETWORK_SECURITY_GROUP(ocid)
                  }
                  stateless         = false                                                         # boolean, default false
                  protocol          = {
                    icmp            = {                                                             # only valid on icmp and icmpv6
                      code          = null
                      type          = null
                    }
                    type            = "tcp"                                                         # icmp, tcp, udp, icmpv6
                  }
                },
                                {
                  description       = "Inbound HTTP"
                  destination       = {                                                             # select either cidr or network_security_group, default is cidr
                    cidr            = {
                      subnet        = "0.0.0.0"
                      prefix        = "0"
                    }
                    network_security_group = {
                      label         = null
                    }
                    port            = {
                      max           = "80"
                      min           = "80"
                    }
                    type            = "CIDR_BLOCK"                                                  # CIDR_BLOCK, SERVICE_CIDR_BLOCK, or NETWORK_SECURITY_GROUP
                  }
                  direction         = "INGRESS"
                  enable            = true
                  label             = "http"
                  source            = {
                    cidr            = {
                      subnet        = "0.0.0.0"
                      prefix        = "0"
                    }
                    network_security_group = {
                      label         = null
                    }
                    port            = {
                      max           = "80"
                      min           = "80"
                    }
                    type            = "CIDR_BLOCK"                                                  # CIDR_BLOCK, SERVICE_CIDR_BLOCK, and NETWORK_SECURITY_GROUP(ocid)
                  }
                  stateless         = false                                                         # boolean, default false
                  protocol          = {
                    icmp            = {                                                             # only valid on icmp and icmpv6
                      code          = null
                      type          = null
                    }
                    type            = "tcp"                                                         # icmp, tcp, udp, icmpv6
                  }
                },
                {
                  description       = "Inbound tftp"
                  destination       = {                                                             # select either cidr or network_security_group, default is cidr
                    cidr            = {
                      subnet        = "0.0.0.0"
                      prefix        = "0"
                    }
                    network_security_group = {
                      label         = null
                    }
                    port            = {
                      max           = "69"
                      min           = "69"
                    }
                    type            = "CIDR_BLOCK"                                                  # CIDR_BLOCK, SERVICE_CIDR_BLOCK, or NETWORK_SECURITY_GROUP
                  }
                  direction         = "INGRESS"
                  enable            = true
                  label             = "tftp"
                  source            = {
                    cidr            = {
                      subnet        = "0.0.0.0"
                      prefix        = "0"
                    }
                    network_security_group = {
                      label         = null
                    }
                    port            = {
                      max           = "69"
                      min           = "69"
                    }
                    type            = "CIDR_BLOCK"                                                  # CIDR_BLOCK, SERVICE_CIDR_BLOCK, and NETWORK_SECURITY_GROUP(ocid)
                  }
                  stateless         = false                                                         # boolean, default false
                  protocol          = {
                    icmp            = {                                                             # only valid on icmp and icmpv6
                      code          = null
                      type          = null
                    }
                    type            = "udp"                                                         # icmp, tcp, udp, icmpv6
                  }
                }
              ]
              suffix                = []
              tags                  = {
                defined             = {}
                freeform            = {}
              }
              vcn                   = {
                compartment         = "shared-network"
                label               = "tenancy"
              }
            }
          ]
          route_table               = [
            {
              compartment           = "shared-network"
              enable                = true
              label                 = "test"
              name                  = "test"
              prefix                = []
              route_rules           = [
                {
                  description       = "test"
                  destination       = {
                    cidr            = {
                      subnet        = "0.0.0.0"
                      prefix        = "0"
                    }
                    type            = "CIDR_BLOCK"                                                  # CIDR_BLOCK or SERVICE_CIDR_BLOCK
                  }
                  enable            = true
                  network_entity    = {
                    label           = "internet"
                    type            = "internet_gateway"                                            # internet_gateway, vcn, or service_gateway
                  }
                }
              ]
              suffix                = []
              tags                  = {
                defined             = {}
                freeform            = {}
              }
              vcn                   = {
                compartment         = "shared_network"
                label               = "tenancy"
              }
            }
          ]
          service_gateway           = [
            {
              compartment           = "shared-network"
              enable                = false
              label                 = "sg1"
              name                  = "sg1"
              prefix                = []
              service               = {
                labels              = []
              }
              suffix                = []
              tags                  = {
                defined             = {}
                freeform            = {}
              }
              vcn                   = {
                compartment         = "shared-network"
                label               = "tenancy"
              }
            }
          ]
          subnets                   = [
            {
              cidr                  = {
                subnet              = "10.1.0.0"
                prefix              = "30"
              }
              compartment           = "shared-network"
              #dns_label             = null
              enable                = true
              #ipv6cidr_block        = null
              #ipv6cidr_blocks       = null
              label                 = "shared-jump"
              name                  = "shared-jump"
              #prohibit              = {
              #  internet_ingress    = null
              #  public_ip_on_vnic   = null
              #}
              #route_table           = null
              #security_lists        = []
              prefix                = []
              tags                  = {
                defined             = {}
                freeform            = {}
              }
              suffix                = []
              vcn                   = {
                compartment         = "shared-network"
                label               = "tenancy"
              }
            },
            {
              cidr                  = {
                subnet              = "10.1.2.0"
                prefix              = "29"
              }
              compartment           = "uae-network"
              #dns_label             = null
              enable                = true
              #ipv6cidr_block        = null
              #ipv6cidr_blocks       = null
              label                 = "apex"
              name                  = "apex"
              #prohibit              = {
              #  internet_ingress    = null
              #  public_ip_on_vnic   = null
              #}
              #route_table           = null
              #security_lists        = []
              prefix                = []
              tags                  = {
                defined             = {}
                freeform            = {}
              }
              suffix                = []
              vcn                   = {
                compartment         = "uae-network"
                label               = "uae"
              }
            }
          ]
          users                     = [
            {
              compartment           = "root"
              description           = "first test user"
              enable                = true
              groups                = [
                "group1",
                "group_all"
              ]
              tags                  = {
                defined             = {}
                freeform            = {
                                        "label": "test1"
                }
              }
              user                  = {
                email               = "test1@no.com"
                name                = "test1"
              }
            },
            {
              compartment           = "root"
              description           = "second test user"
              enable                = true
              groups                = [
                "group2",
                "group_all",
                "group_all2"
              ]
              tags                  = {
                defined             = {}
                freeform            = {
                                        "label": "test2"
                }
              }
              user                  = {
                email               = "test2@no.com"
                name                = "test2"
              }
            }
          ]
          vcns                      = [
            { #tenancy
              compartment           = "shared-network"

              byoipv6cidr_details   = {
                byoipv6range_id     = null
                ipv6cidr_block      = null
              }
              #cidr_block            = null                                                         #depricated
              cidr_blocks           = [
                                        "10.1.0.0/23"
              ]
              defined_tags          = {}
              dns_label             = null
              enable                = true
              #id                    = "ocid1.vcn.oc1.iad.amaaaaaaffki3maabrofnzz73fpza2rpun3ureqhqt6yzc2ybs7c73weujha"
              label                 = "tenancy"
              name                  = "tenancy"
              tags                  = {
                defined             = {}
                freeform            = {}
              }
              ipv6private_cidr_blocks = []
              #is_ipv6enabled        = null
              #is_oracle_gua_allocation_enabled = null
              prefix                = []
              suffix                = []
            },
            { #tennant - uae
              compartment           = "uae-network"

              byoipv6cidr_details   = {
                byoipv6range_id     = null
                ipv6cidr_block      = null
              }
              #cidr_block            = null                                                         #depricated
              cidr_blocks           = [
                                        "10.1.2.0/23"
              ]
              defined_tags          = {}
              dns_label             = null
              enable                = true
              #id                    = "ocid1.vcn.oc1.iad.amaaaaaaffki3maaftxgbakgletcefxktxkyaeaosmyw2rn4ph2wwdyyjd6a"
              label                 = "uae"
              name                  = "uae"
              tags                  = {
                defined             = {}
                freeform            = {}
              }
              ipv6private_cidr_blocks = []
              #is_ipv6enabled        = null
              #is_oracle_gua_allocation_enabled = null
              prefix                = []
              suffix                = []
            }
          ]
          /*
          vlans                     = [
            {
              availability_domain   = null
              cidr_block            = "10.1.0.0/24"
              compartment           = "tenancy"
              display_name          = null
              enable                = false
              nsgs                  = []
              prefix                = []
              route_table           = null
              suffix                = []
              tags                  = {
                defined             = {}
                freeform            = {
                                        "label": "vlan10"
                }
              }
              vcn                   = "test"
              vlan_tag              = 10

            }
          ]
          */
        }
      }
      default                       = {
        application                 = {}
        infrastructure              = {
          compartments              = {
            outputs                 = {
              list                  = {
                enable              = false
              }
              map                   = {
                enable              = true
              }
              raw                   = {
                enable              = false
              }
              test                  = {
                enable              = false
              }
            }
            prefix                  = []
            suffix                  = []
            version                 = "0.1.1"
          }
          drg                       = {
            enable                  = true
            outputs                 = {
              list                  = {
                enable              = false
              }
              map                   = {
                enable              = true
              }
              raw                   = {
                enable              = false
              }
            }
            prefix                  = []
            suffix                  = [
                                        "drg"
            ]
            version                 = "0.1.0"
          }
          groups                    = {}
          internet_gateway          = {
            enable                  = true
            outputs                 = {
              list                  = {
                enable              = false
              }
              map                   = {
                enable              = true
              }
              raw                   = {
                enable              = false
              }
            }
            prefix                  = []
            suffix                  = [
                                        "ig"
            ]
            version                 = "0.1.1"
          }
          local_peering_gateways    = {
            enable                  = true
            outputs                 = {
              list                  = {
                enable              = false
              }
              map                   = {
                enable              = true
              }
              raw                   = {
                enable              = false
              }
            }
            prefix                  = []
            suffix                  = [
                                        "lpg"
            ]
            version                 = "0.1.1"
          }
          modules                   = {
            compartments            = {
              enable                = true
              version               = "0.1.1"
            }
            drg                     = {
              enable                = true
              version               = "0.1.0"
            }
            groupmembership         = {
              enable                = true
              version               = "0.1.0"
            }
            groups                  = {
              enable                = true
              version               = "0.1.0"
            }
            internet_gateway        = {
              enable                = true
              version               = "0.1.0"
            }
            local_peering_gateways  = {
              enable                = true
              version               = "0.1.0"
            }
            nat_gateway             = {
              enable                = true
              version               = "0.1.0"
            }
            network_security_group  = {
              enable                = true
              version               = "0.1.0"
            }
            route_table             = {
              enable                = true
              version               = "0.1.0"
            }
            service_gateway         = {
              enable                = true
              version               = "0.1.0"
            }
            subnets                 = {
              enable                = true
              version               = "0.1.0"
            }
            users                   = {
              enable                = true
              version               = "0.1.0"
            }
            vcns                    = {
              enable                = true
              version               = "0.1.0"
            }
            vlans                   = {
              enable                = true
              version               = "0.1.0"
            }
          }
          nat_gateway               = {
            outputs                 = {
              list                  = {
                enable              = false
              }
              map                   = {
                enable              = true
              }
              raw                   = {
                enable              = false
              }
              test                  = {
                enable              = false
              }
            }
            prefix                  = []
            suffix                  = [
                                        "ng"
            ]
          }
          network_security_group    = {
            additional              = []
            outputs                 = {
              list                  = {
                enable              = false
              }
              map                   = {
                enable              = true
              }
              raw                   = {
                enable              = false
              }
              test                  = {
                enable              = false
              }
            }
            prefix                  = []
            suffix                  = [
                                        "nsg"
            ]
          }
          route_table               = {
            outputs                 = {
              list                  = {
                enable              = false
              }
              map                   = {
                enable              = true
              }
              raw                   = {
                enable              = false
              }
              test                  = {
                enable              = false
              }
            }
            prefix                  = []
            suffix                  = [
                                        "rt"
            ]
          }
          service_gateway           = {
            outputs                 = {
              list                  = {
                enable              = false
              }
              map                   = {
                enable              = true
              }
              raw                   = {
                enable              = false
              }
              test                  = {
                enable              = false
              }
            }
            prefix                  = []
            suffix                  = [
                                        "sg"
            ]
          }
          services                  = {
            outputs                 = {
              list                  = {
                enable              = false
              }
              map                   = {
                enable              = false
              }
              raw                   = {
                enable              = true
              }
              test                  = {
                enable              = false
              }
            }
            prefix                  = []
            suffix                  = []
          }
          shapes                    = {
            outputs                 = {
              list                  = {
                enable              = false
              }
              map                   = {
                enable              = false
              }
              raw                   = {
                enable              = false
              }
              test                  = {
                enable              = false
              }
            }
            prefix                  = []
            suffix                  = []
          }
          subnets                   = {
            outputs                 = {
              list                  = {
                enable              = false
              }
              map                   = {
                enable              = true
              }
              raw                   = {
                enable              = false
              }
              test                  = {
                enable              = false
              }
            }
            prefix                  = []
            suffix                  = [
                                        "sn"
            ]
          }
          users                     = {}
          vcns                      = {
            outputs                 = {
              list                  = {
                enable              = false
              }
              map                   = {
                enable              = true
              }
              raw                   = {
                enable              = false
              }
              test                  = {
                enable              = false
              }
            }
            prefix                  = []
            suffix                  = [
                                        "vcn"
            ]
          }
          /*
          vlans                     = {
            prefix                  = []
            suffix                  = [
                                        "vlan"
            ]

          }
          */
        }
      }
    }
  }
}