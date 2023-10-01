variable access_level           {
  default                       = "any"
  description                   = "value"
  #sensitive                     = false
}
variable after                {
  default                         = null
  description                     = ""
  #sensative                       = false
}
variable id                     {
  default                       = null
  description                   = "value"
  #sensitive                     = false
}
variable name                   {
  default                       = null
  description                   = "value"
  #sensitive                     = false
}
variable state                  {
  default                       = "ACTIVE"
  description                   = "value"
  #sensitive                     = false
  /*
  Supported values are: 
    CREATING
    ACTIVE
    INACTIVE
    DELETING
    DELETED
  */
}