variable "et" {
  type                  = map
  default               = {
    chrismurray         = {
      alarms            = {
        enable          = false
        jira            = {
          project       = null
          component     = null
          db_component  = null
          item          = null
        }
      }
      compute           = true
      deploy_on_every_release = false
      database_container_name = null
      enable            = true
      instance          = {
        apex            = {
          count         = 2
          display_name  = "Apex"
          enable        = true
          image         = 20210610
          shape         = "VM.Standard2.4"
          lb            = {
            in          = {
              count     = null
              shape     = null
            }
            ex          = {
              count     = 1
              shape     = "100Mbps"
            }
          }
          name          = "apex"
        }
        idp             = {
          count         = 2
          display_name  = "IDP"
          enable        = true
          image         = 20210610
          shape         = "VM.Standard2.4"
          lb            = {
            in          = {
              count     = null
              shape     = null
            }
            ex          = {
              count     = 1
              shape     = "100Mbps"
            }
          }
          name          = "idp"
        }
      }
      name                = "chrismurray092776"
      phase               = null
      prefix              = "prs"
      predecessors        = []
      region              = "phx"
      sleep               = 60
      snowflake           = null
      suffix              = "dev"
      tag                 = {
        pod_usage_reporting = null
      }
      uniquifier          = null
    }
    chrismurray092776   = {
      alarms            = {
        enable          = false
        jira            = {
          project       = null
          component     = null
          db_component  = null
          item          = null
        }
      }
      compute           = true
      deploy_on_every_release = false
      database_container_name = null
      enable            = true
      instance          = {
        apex            = {
          count         = 2
          display_name  = "Apex"
          enable        = true
          image         = 20210610
          shape         = "VM.Standard2.4"
          lb            = {
            in          = {
              count     = null
              shape     = null
            }
            ex          = {
              count     = 1
              shape     = "100Mbps"
            }
          }
          name          = "apex"
        }
        idp             = {
          count         = 2
          display_name  = "IDP"
          enable        = true
          image         = 20210610
          shape         = "VM.Standard2.4"
          lb            = {
            in          = {
              count     = null
              shape     = null
            }
            ex          = {
              count     = 1
              shape     = "100Mbps"
            }
          }
          name          = "idp"
        }
      }
      name                = "chrismurray092776"
      phase               = null
      prefix              = "prs"
      predecessors        = []
      region              = "phx"
      sleep               = 60
      snowflake           = null
      suffix              = "dev"
      tag                 = {
        pod_usage_reporting = null
      }
      uniquifier          = null
    }
  }
}