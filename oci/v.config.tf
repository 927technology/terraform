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
            },           
            { #/shared/network/lpg
              depth                 = 3
              description           = "/shared/network/lpg"
              enable                = true
              enable_delete         = true
              name                  = "lpg"
              label                 = "shared-network-lpg"
              parent                = "shared-network"
              prefix                = []
              suffix                = []
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
          local_peering_gateways    = [
            {
              compartment           = "shared-network"
              enable                = false
              label                 = "tenancy"
              name                  = "tenancy"
              peer                  = null
              prefix                = []
              #route_table           = null
              tags                  = {
                defined             = {}
                freeform            = {}
              }
              suffix                = []
              vcn                   = {
                compartment         = "shared-network"
                name                = "tenancy"
              }
            },
            {
              compartment           = "uae-network"
              enable                = false
              label                 = "uae"
              name                  = "uae"
              peer                  = null
              prefix                = []
              #route_table           = null
              tags                  = {
                defined             = {}
                freeform            = {}
              }
              suffix                = []
              vcn                   = {
                compartment         = "uae-network"
                name                = "uae-network"
              }
            }
          ]
          modules                   = {
            compartments            = {
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
            local_peering_gateways  = {
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
                                        "10.1.0.0/23"
              ]
              defined_tags          = {}
              dns_label             = null
              enable                = true
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
          groups                    = {}
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
                enable              = true
              }
              test                  = {
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
            groupmembership         = {
              enable                = true
              version               = "0.1.0"
            }
            groups                  = {
              enable                = true
              version               = "0.1.0"
            }
            local_peering_gateways  = {
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