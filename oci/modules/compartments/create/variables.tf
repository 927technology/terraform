variable access_level               {
  default                           = "any"
  description                       = "value"
  #sensitive                         = false
}

variable after                      {
  default                           = []
}

variable compartments_map           {
  default                           = {}
  #sensitive                         = false
}

variable default_map                {
  default                           = {}
  #sensitive                         = false
}

variable et_map                     {
  default                           = {}
  #sensitive                         = false
}

variable relationship               {
  default                           = null
  #sensitive                         = false
}
variable tenancy_map                {
  default                           = {}
  #sensitive                         = false
}

variable name                       {
  default                           = null
  description                       = "value"
  #sensitive                         = false
}

variable state                      {
  default                           = "ACTIVE"
  description                       = "value"
  #sensitive                         = false
  /*
  Supported values are: 
    CREATING
    ACTIVE
    INACTIVE
    DELETING
    DELETED
  */
}