variable "instance" {
  type                = map
  default             = { 
    "chrismurray092776" = {
      apex              = {
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
      }
      idp               = {
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
      }    
      name              = "chrismurray092776"
    }
    "chrismurray"         = {
      apex              = {
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
      }
      idp               = {
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
      }    
      name              = "chrismurray"
    }
  }
}