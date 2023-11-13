variable compartment_map            {
  default                           = {}
  #sensitive                         = false
}

variable default_map                {
  default                           = {}
  #sensitive                         = false
}

variable et_map                     {
  default                           = {}
  #sensative                         = false
}

variable id                         {
  default                           = null
  description                       = "The ID of the compartment"
  #required                          = true
  #sensitive                         = false  
}