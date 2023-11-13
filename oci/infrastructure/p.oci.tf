provider "oci" {
  tenancy_ocid          = var.tenancy[var.local.execution_target.name].id
  private_key_password  = var.tenancy[var.local.execution_target.name].user.private_key.password
  private_key_path      = var.tenancy[var.local.execution_target.name].user.private_key.path
  fingerprint           = var.tenancy[var.local.execution_target.name].user.private_key.fingerprint
  region                = var.region[var.local.execution_target.region].name.long
  user_ocid             = var.tenancy[var.local.execution_target.name].user.id
}