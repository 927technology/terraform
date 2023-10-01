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
  description                     = "The ID of a user in the identity provider."
  #required                        = false
  #sensitive                       = false  
}
variable identity_provider_id     {
  default                         = null
  description                     = "The id of the identity provider."
  #required                        = false
  #sensitive                       = false  
}
variable name                     {
  default                         = null
  description                     = "A filter to only return resources that match the given name exactly."
  #required                        = false
  #sensitive                       = false  
}
variable provider_id              {
  default                         = null
  description                     = ""
  #required                        = false
  #sensative                       = false
}
variable state {
  default                         = "ACTIVE"
  description                     = "A filter to only return resources that match the given lifecycle state. The state value is case-insensitive."
  #required                        = false
  #sensitive                       = false  
}