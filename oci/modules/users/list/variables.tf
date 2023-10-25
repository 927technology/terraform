variable id                         {
  default                           = null
  description                       = "value"
  #sensitive                         = false
}

variable state {
  default                           = "ACTIVE"
  description                       = "A filter to only return resources that match the given lifecycle state. The state value is case-insensitive."
  #required                          = false
  #sensitive                         = false  
}