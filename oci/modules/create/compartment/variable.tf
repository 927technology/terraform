variable "compartment-app_list" {
  default             = null
  description         = "List of applications from ./instance.tf filtered by execution target and enable=true"
  sensitive           = false
}

variable "compartment-instance_map" {
  description         = ""
  sensitive           = false
}

variable "compartment-et" {
  description         = ""
  sensitive           = false
}

variable "compartment-et_map" {
  description         = ""
  sensitive           = false
}

variable "compartment-region_map" {
  description         = ""
  sensitive           = false
}