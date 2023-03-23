provider "oci" {
  tenancy_ocid          = var.tenancy["oci"].ocid
  private_key_password  = var.tenancy["oci"].user.private_key.password
  private_key_path      = var.tenancy["oci"].user.private_key.path
  fingerprint           = var.tenancy["oci"].user.private_key.fingerprint
  region                = var.region[var.tenancy["oci"].region].name.long
  user_ocid             = var.tenancy["oci"].user.ocid
}