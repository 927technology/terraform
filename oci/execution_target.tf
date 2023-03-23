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
      name                = "chrismurray092776"
      phase               = null
      prefix              = "prs"
      predecessors        = []
      region              = "iad"
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