provider "oci" {
  tenancy_ocid        = var.tenancy["oci"].ocid
  private_key_path    = var.tenancy["oci"].user.private_key.path
  fingerprint         = var.tenancy["oci"].user.private_key.fingerprint
  region              = "us-ashburn-1"
  user_ocid           = var.tenancy["oci"].user.ocid
}