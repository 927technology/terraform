variable "config" {
  type                            = map
  default                         = {
    et                            = {
      cmurray                     = {
        compartments              = {
          /*
          ManagedCompartmentForPaaS = {
            description           = "idcs-2cc6aba2a58c4e7b84b5daca8dc0a045|27484836|cmurray@927.technology-841928"
            enable                = true
            enable_delete         = false
            parent                = "root"
            tags                  = {
              defined             = {}
              freeform            = {}
            }
          }
          */
          tenancy                 = {
            description           = "network compartment for tenancy"
            enable                = true
            enable_delete         = true
            heirachy              = {
              parent              = "root"
              relationship        = "parent"
            }
            name                  = "tenancy"
            prefix                = [
              /*  module 0.1.0 only supports 1 or 2 prefixes
                  additional prefixes are ignored

                  default prefixes are ignored if any
                  prefixes are defined in the et and
                  et prefixes are ignored if any
                  prefixes are defined in the compartment.
              */
            ]
            suffix                = [
              /*  module 0.1.0 only supports 1 suffix
                  additional suffixes are ignored

                  default suffixes are ignored if any
                  suffixes are defined in the et and
                  et suffixes are ignored if any
                  suffixes are defined in the compartment.
              */
            ]
            tags                  = {
              defined             = {}
              freeform            = {}
            }
          }
          tenancy-network         = {
            description           = "network compartment for tenancy"
            enable                = true
            enable_delete         = true
            heirachy              = {
              parent              = "tenancy"
              relationship        = "child"
            }
            name                  = "tenancy-network"
            prefix                = [
              /*  module 0.1.0 only supports 1 or 2 prefixes
                  additional prefixes are ignored

                  default prefixes are ignored if any
                  prefixes are defined in the et and
                  et prefixes are ignored if any
                  prefixes are defined in the compartment.
              */
            ]
            suffix                = [
              /*  module 0.1.0 only supports 1 suffix
                  additional suffixes are ignored

                  default suffixes are ignored if any
                  suffixes are defined in the et and
                  et suffixes are ignored if any
                  suffixes are defined in the compartment.
              */
            ]
            tags                  = {
              defined             = {}
              freeform            = {}
            }
          }
          tenancy-shared          = {
            description           = "network compartment for tenancy"
            enable                = true
            enable_delete         = true
            heirachy              = {
              parent              = "tenancy"
              relationship        = "child"
            }
            name                  = "tenancy-shared"
            prefix                = [
              /*  module 0.1.0 only supports 1 or 2 prefixes
                  additional prefixes are ignored

                  default prefixes are ignored if any
                  prefixes are defined in the et and
                  et prefixes are ignored if any
                  prefixes are defined in the compartment.
              */
            ]
            suffix                = [
              /*  module 0.1.0 only supports 1 suffix
                  additional suffixes are ignored

                  default suffixes are ignored if any
                  suffixes are defined in the et and
                  et suffixes are ignored if any
                  suffixes are defined in the compartment.
              */
            ]
            tags                  = {
              defined             = {}
              freeform            = {}
            }
          }
          test-tenant             = {
            description           = "root compartment for test tenant"
            enable                = true
            enable_delete         = true
            heirachy              = {
              parent              = "root"
              relationship        = "parent"
            }
            name                  = "test"
            prefix                = [
              /*  module 0.1.0 only supports 1 or 2 prefixes
                  additional prefixes are ignored

                  default prefixes are ignored if any
                  prefixes are defined in the et and
                  et prefixes are ignored if any
                  prefixes are defined in the compartment.
              */
            ]
            suffix                = [
              /*  module 0.1.0 only supports 1 suffix
                  additional suffixes are ignored

                  default suffixes are ignored if any
                  suffixes are defined in the et and
                  et suffixes are ignored if any
                  suffixes are defined in the compartment.
              */
            ]
            tags                  = {
              defined             = {}
              freeform            = {}
            }
          }
          test-apex               = {
            description           = "apex compartment for test tennant"
            enable                = true
            enable_delete         = true
            heirachy              = {
              parent              = "test-tenant"
              relationship        = "child"
            }
            prefix                = [
              /*  module 0.1.0 only supports 1 or 2 prefixes
                  additional prefixes are ignored

                  default prefixes are ignored if any
                  prefixes are defined in the et and
                  et prefixes are ignored if any
                  prefixes are defined in the compartment.
              */
            ]
            suffix                = [
              /*  module 0.1.0 only supports 1 suffix
                  additional suffixes are ignored

                  default suffixes are ignored if any
                  suffixes are defined in the et and
                  et suffixes are ignored if any
                  suffixes are defined in the compartment.
              */
            ]
            tags                  = {
              defined             = {}
              freeform            = {}
            }

          }
          test-ap                 = {
            description           = "authproxy compartment for test tennant"
            enable                = true
            enable_delete         = true
            heirachy              = {
              parent              = "test-tenant"
              relationship        = "child"
            }
            prefix                = [
              /*  module 0.1.0 only supports 1 or 2 prefixes
                  additional prefixes are ignored

                  default prefixes are ignored if any
                  prefixes are defined in the et and
                  et prefixes are ignored if any
                  prefixes are defined in the compartment.
              */
            ]
            suffix                = [
              /*  module 0.1.0 only supports 1 suffix
                  additional suffixes are ignored

                  default suffixes are ignored if any
                  suffixes are defined in the et and
                  et suffixes are ignored if any
                  suffixes are defined in the compartment.
              */
            ]
            tags                  = {
              defined             = {}
              freeform            = {}
            }

          }
          test-idp                = {
            description           = "authproxy compartment for test tennant"
            enable                = true
            enable_delete         = true
            heirachy              = {
              parent              = "test-tenant"
              relationship        = "child"
            }
            prefix                = [
              /*  module 0.1.0 only supports 1 or 2 prefixes
                  additional prefixes are ignored

                  default prefixes are ignored if any
                  prefixes are defined in the et and
                  et prefixes are ignored if any
                  prefixes are defined in the compartment.
              */
            ]
            suffix                = [
              /*  module 0.1.0 only supports 1 suffix
                  additional suffixes are ignored

                  default suffixes are ignored if any
                  suffixes are defined in the et and
                  et suffixes are ignored if any
                  suffixes are defined in the compartment.
              */
            ]
            tags                  = {
              defined             = {}
              freeform            = {}
            }

          }
          test-network            = {
            description           = "network compartment for test tennant"
            enable                = true
            enable_delete         = true
            heirachy              = {
              parent              = "test-tenant"
              relationship        = "child"
            }
            prefix                = [
              /*  module 0.1.0 only supports 1 or 2 prefixes
                  additional prefixes are ignored

                  default prefixes are ignored if any
                  prefixes are defined in the et and
                  et prefixes are ignored if any
                  prefixes are defined in the compartment.
              */
            ]
            suffix                = [
              /*  module 0.1.0 only supports 1 suffix
                  additional suffixes are ignored

                  default suffixes are ignored if any
                  suffixes are defined in the et and
                  et suffixes are ignored if any
                  suffixes are defined in the compartment.
              */
            ]
            tags                  = {
              defined             = {}
              freeform            = {}
            }

          }
          test-support            = {
            description           = "authproxy compartment for test tennant"
            enable                = true
            enable_delete         = true
            heirachy              = {
              parent              = "test-tenant"
              relationship        = "child"
            }
            prefix                = [
              /*  module 0.1.0 only supports 1 or 2 prefixes
                  additional prefixes are ignored

                  default prefixes are ignored if any
                  prefixes are defined in the et and
                  et prefixes are ignored if any
                  prefixes are defined in the compartment.
              */
            ]
            suffix                = [
              /*  module 0.1.0 only supports 1 suffix
                  additional suffixes are ignored

                  default suffixes are ignored if any
                  suffixes are defined in the et and
                  et suffixes are ignored if any
                  suffixes are defined in the compartment.
              */
            ]
            tags                  = {
              defined             = {}
              freeform            = {}
            }

          }
          test-support2           = {
            description           = "cmtest"
            enable                = false
            enable_delete         = true
            heirachy              = {
              parent              = "test-idp"
              relationship        = "gchild"
            }
            prefix                = [
              /*  module 0.1.0 only supports 1 or 2 prefixes
                  additional prefixes are ignored

                  default prefixes are ignored if any
                  prefixes are defined in the et and
                  et prefixes are ignored if any
                  prefixes are defined in the compartment.
              */
            ]
            suffix                = [
              /*  module 0.1.0 only supports 1 suffix
                  additional suffixes are ignored

                  default suffixes are ignored if any
                  suffixes are defined in the et and
                  et suffixes are ignored if any
                  suffixes are defined in the compartment.
              */
            ]
            tags                  = {
              defined             = {}
              freeform            = {}
            }

          }
        }
        groups                    = {
          group1                  = {
            description           = "first test group"
            enable                = true
            id                    = "afc9615c-4e7b-4f95-ad77-487a06bf0ffd"
            parent                = "root"
            tags                  = {
              defined             = {}
              freeform            = {}
            }
          }
          group2                  = {
            description           = "second test group"
            enable                = true
            parent                = "root"
            id                    = "9633927b-8746-4ef1-bdba-f2749c85e7d1"
            tags                  = {
              defined             = {}
              freeform            = {}
            }
          }
          group_all               = {
            description           = "all test group"
            enable                = true
            id                    = "998b95da-bc78-4cde-a2d7-799ad9443cb1"
            parent                = "root"
            tags                  = {
              defined             = {}
              freeform            = {}
            }
          }
          group_all2               = {
            description           = "all test group"
            enable                = true
            id                    = "00a4d7fa-83a2-45ce-9a7e-09c799d0c48d"
            parent                = "root"
            tags                  = {
              defined             = {}
              freeform            = {}
            }
          }
        }
        modules                   = {
          compartments            = {
            enable                = false
            prefix                = [
              /*  module 0.1.0 only supports 1 or 2 prefixes
                  additional prefixes are ignored

                  default prefixes are ignored if any
                  prefixes are defined in the et and
                  et prefixes are ignored if any
                  prefixes are defined in the compartment.
              */
            ]
            suffix                = [
              /*  module 0.1.0 only supports 1 suffix
                  additional suffixes are ignored

                  default suffixes are ignored if any
                  suffixes are defined in the et and
                  et suffixes are ignored if any
                  suffixes are defined in the compartment.
              */
            ]
            version               = null
          }
          groupmembership         = {
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
        }
        users                     = {
          test1                   = {
            description           = "first test user"
            enable                = true
            groups                = [
              "group1",
              "group_all"
            ]
            id                    = "403d6d20-bde0-4510-97c7-0a984b5b9c1a"
            name                  = "test1"
            parent                = "root"
            tags                  = {
              defined             = {}
              freeform            = {}
            }
            user                  = {
              email               = "test1@no.com"
              name                = "test1"
            }
          }
          test2                   = {
            description           = "second test user"
            enable                = true
            groups                = [
              "group2",
              "group_all",
              "group_all2"
            ]
            id                    = "29b4c720-8965-47cd-a468-5df568ec539e"
            name                  = "test2"
            parent                = "root"
            tags                  = {
              defined             = {}
              freeform            = {}
            }
            user                  = {
              email               = "test2@no.com"
              name                = "test2"
            }
          }
        }
      }
      default                     = {
        modules                   = {
          compartments            = {
            enable                = true
            prefix                = [
              /*  module 0.1.0 only supports 1 or 2 prefixes
                  additional prefixes are ignored

                  default prefixes are ignored if any
                  prefixes are defined in the et and
                  et prefixes are ignored if any
                  prefixes are defined in the compartment.
              */
              "prs"
            ]
            suffix                = [
              /*  module 0.1.0 only supports 1 suffix
                  additional suffixes are ignored

                  default suffixes are ignored if any
                  suffixes are defined in the et and
                  et suffixes are ignored if any
                  suffixes are defined in the compartment.
              */
              "cmp"
            ]
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
          users                   = {
            enable                = true
            version               = "0.1.0"
          }
        }
      }
    }
  }
}