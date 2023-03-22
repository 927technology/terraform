output "count" {
  description         = ""
  sensitive           = false
  value               = length(data.oci_core_instances.test_instance.instances)
}

output "object" {
    description       = ""
    sensitive         = false
    value             = data.oci_core_instances.test_instance.instances
}

output "search" {
  description         = ""
  sensitive           = false
  value               = [
    for instance in data.oci_core_instances.test_instance.instances : instance
    if var.instance_filter !=null && ( instance.operating_system == var.instance_filter || instance.operating_system_version == var.instance_filter )
  ]
}