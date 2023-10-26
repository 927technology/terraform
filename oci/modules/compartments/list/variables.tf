variable access_level               {
  default                           = "any"
  description                       = "value"
  #sensitive                         = false
}

variable default_map                {
  default                           = {}
  #sensitive                         = false
}

variable tenancy_map                {
  default                           = {}
  #sensitive                         = false
}

variable id                         {
  default                           = null
  description                       = "value"
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