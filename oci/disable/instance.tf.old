variable "instance" {
  type                  = map(any)
  default               = { 
    chrismurray092776   = {
      apex              = {
        compartment     = {
          #defined_tags  = {}                                                                       #enabling this will overwrite OCI auto create tags
          enable_delete = true
          freeform_tags = {}
        }
        compute         = true
        count           = 2
        display_name    = "Apex"
        enable          = true
        image           = 20210610
        shape           = "VM.Standard2.4"
        lb              = {
          in            = {
            count       = null
            shape       = null
          }
          ex            = {
            count       = 1
            shape       = "100Mbps"
          }
        }
        name            = "apex"
        vcn             = {
          byoipv6cidr_details = {
            byoipv6range_id = null
            ipv6cidr_block  = null
          }
          cidr_block    = "10.0.1.0/24"
          cidr_blocks   = []
          #defined_tags  = {}                                                                       #enabling this will overwrite OCI auto create tags
          dns_label     = "test.local"
          freeform_tags = []
          ipv6private_cidr_blocks = []
          is_ipv6enabled  = false
          is_oracle_gua_allocation_enabled = false
        }
      }
      idp               = {
        compartment     = {
          #defined_tags  = {}                                                                       #enabling this will overwrite OCI auto create tags
          enable_delete = true
          freeform_tags = {}
        }
        compute         = true
        count           = 2
        display_name    = "IDP"
        enable          = true
        image           = 20210610
        shape           = "VM.Standard2.4"
        lb              = {
          in            = {
            count       = null
            shape       = null
          }
          ex            = {
            count       = 1
            shape       = "100Mbps"
          }
        }
        name            = "idp"
        vcn             = {
          byoipv6cidr_details = {
            byoipv6range_id = null
            ipv6cidr_block  = null
          }
          cidr_block    = "10.0.2.0/24"
          cidr_blocks   = []
          #defined_tags  = {}                                                                       #enabling this will overwrite OCI auto create tags
          dns_label     = "test.local"
          freeform_tags = []
          ipv6private_cidr_blocks = []
          is_ipv6enabled  = false
          is_oracle_gua_allocation_enabled = false
        }
      }        
      #name              = "chrismurray092776"
    }
    chrismurray         = {
      apex              = {
        compartment     = {
          #defined_tags  = {}                                                                       #enabling this will overwrite OCI auto create tags
          enable_delete = true
          freeform_tags = {}
        }
        compute         = true
        count           = 2
        display_name    = "Apex"
        enable          = false
        image           = 20210610
        shape           = "VM.Standard2.4"
        lb              = {
          in            = {
            count       = null
            shape       = null
          }
          ex            = {
            count       = 1
            shape       = "100Mbps"
          }
        }
        name            = "apex"
        vcn             = {
          byoipv6cidr_details = {
            byoipv6range_id = null
            ipv6cidr_block  = null
          }
          cidr_block    = "10.0.1.0/24"
          cidr_blocks   = []
          #defined_tags  = {}                                                                       #enabling this will overwrite OCI auto create tags
          dns_label     = "test.local"
          freeform_tags = []
          ipv6private_cidr_blocks = []
          is_ipv6enabled  = false
          is_oracle_gua_allocation_enabled = false
        }
      }
      idp               = {
        compartment     = {
          #defined_tags  = {}                                                                       #enabling this will overwrite OCI auto create tags
          enable_delete = true
          freeform_tags = {}
        }
        compute         = true
        count           = 2
        display_name    = "IDP"
        enable          = true
        image           = 20210610
        shape           = "VM.Standard2.4"
        lb              = {
          in            = {
            count       = null
            shape       = null
          }
          ex            = {
            count       = 1
            shape       = "100Mbps"
          }
        }
        name            = "idp"
        vcn             = {
          byoipv6cidr_details = {
            byoipv6range_id = null
            ipv6cidr_block  = null
          }
          cidr_block    = "10.0.2.0/24"
          cidr_blocks   = []
          #defined_tags  = {}                                                                       #enabling this will overwrite OCI auto create tags
          dns_label     = "test.local"
          freeform_tags = []
          ipv6private_cidr_blocks = []
          is_ipv6enabled  = false
          is_oracle_gua_allocation_enabled = false
        }
      }    
      #name              = "chrismurray"
    }
  }
}