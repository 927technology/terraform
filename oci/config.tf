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
              description           = "idcs-2cc6aba2a58c4e7b84b5daca8dc0a045|27484836|cmurray@927.technology-841928"
              enable                = true
              enable_delete         = false
              parent                = "root"
              tags                  = {
                defined             = {}
                freeform            = {}
              }
            },
            */
            {
              description           = "network compartment for tenancy"
              enable                = true
              enable_delete         = true
              heirachy              = {
                parent              = "root"
                relationship        = "parent"
              }
              name                  = "tenancy"
              prefix                = []
              suffix                = []
              tags                  = {
                defined             = {}
                freeform            = { 
                                        "label": "tenancy" 
                                      }
              }
            },
            {
              description           = "network compartment for tenancy"
              enable                = false
              enable_delete         = true
              heirachy              = {
                parent              = "tenancy"
                relationship        = "child"
              }
              name                  = "tenancy-network"
              prefix                = []
              suffix                = []
              tags                  = {
                defined             = {}
                freeform            = { 
                                        "label": "tenancy-network" 
                                      }
              }
            },
            {
              description           = "shared compartment for tenancy"
              enable                = true
              enable_delete         = true
              heirachy              = {
                parent              = "tenancy"
                relationship        = "child"
              }
              name                  = "tenancy-shared"
              prefix                = []
              suffix                = []
              tags                  = {
                defined             = {}
                freeform            = { 
                                        "label": "tenancy-shared" 
                                      }
              }
            },
            {
              description           = "shared jumphosts for tenancy"
              enable                = true
              enable_delete         = true
              heirachy              = {
                parent              = "tenancy-shared"
                relationship        = "gchild"
              }
              name                  = "tenancy-shared-jump"
              prefix                = []
              suffix                = []
              tags                  = {
                defined             = {}
                freeform            = { 
                                        "label": "tenancy-shared-jump" 
                                      }
              }
            },
            {
              description           = "root compartment for test tenant"
              enable                = true
              enable_delete         = true
              heirachy              = {
                parent              = "tenancy-shared-jump"
                relationship        = "ggchild"
              }
              name                  = "test"
              prefix                = []
              suffix                = []
              tags                  = {
                defined             = {}
                freeform            = { 
                                        "label": "test"
                                      }
              }
            }
          ]
          groups                    = [
            {
              compartment           = "root"
              description           = "first test group"
              enable                = true
              id                    = "afc9615c-4e7b-4f95-ad77-487a06bf0ffd"
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
              id                    = "9633927b-8746-4ef1-bdba-f2749c85e7d1"
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
              id                    = "00a4d7fa-83a2-45ce-9a7e-09c799d0c48d"
              tags                  = {
                defined             = {}
                freeform            = {
                                        "label": "all.test_group"
                }
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
              enable                = true
              version               = null
            }
            users                   = {
              enable                = true
              version               = null
            }
            vcns                    = {
              enable                = true
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
            {
              compartment           = "root"

              byoipv6cidr_details   = {
                byoipv6range_id     = null
                ipv6cidr_block      = null
              }
              #cidr_block            = null       #depricated
              cidr_blocks           = "10.1.0.0/16"
              defined_tags          = {}
              dns_label             = null
              tags                  = {
                defined             = {}
                freeform            = {
                                        "label": "test-vcn"
                }
              }
              ipv6private_cidr_blocks = []
              is_ipv6enabled        = false
              is_oracle_gua_allocation_enabled = false
            }
          ]
        }
      }
      default                       = {
        application                 = {}
        infrastructure              = {
          compartments              = {
            prefix                  = [
              "iad"
            ]
            suffix                  = [
              "cmp"
            ]
          }
          groups                    = {}
          modules                   = {
            compartments            = {
              enable                = true
              prefix                = [
                "iad"
              ]
              suffix                = [
                "cmp"
              ]
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
            users                   = {
              enable                = true
              version               = "0.1.0"
            }
            vcns                    = {
              enable                = true
              version               = "0.1.0"
            }
          }
          users                     = {}
          vcns                      = {
            prefix                  = []
            suffix                  = [
                                        "vcn"
            ]
          }
        }
      }
    }
  }
}