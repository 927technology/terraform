variable after                    {
  default                         = null
  description                     = ""
  #sensative                       = false
}
variable id                       {
  default                         = null
  description                     = "The ID of the compartment"
  #required                        = true
  #sensitive                       = false  
}
variable external_id              {
  default                         = null
  description                     = "The ID of a group in the identity provider."
  #required                        = false
  #sensitive                       = false  
}
variable name                     {
  default                         = null
  description                     = "A filter to only return resources that match the given name exactly."
  #required                        = false
  #sensitive                       = false  
}
variable state {
  default                         = "ACTIVE"
  description                     = "A filter to only return resources that match the given lifecycle state. The state value is case-insensitive."
  #required                        = false
  #sensitive                       = false  
}