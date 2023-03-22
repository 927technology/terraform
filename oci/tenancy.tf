variable "tenancy" {
  type                = map(any)
  default             = {
    oci = {
      user            = {
        name          = "chrismurray092776"
        ocid          = "ocid1.user.oc1..aaaaaaaauxfnrm7b4xasw3zimyksfkqgxvt5xtr63vvx2igxka4inwqxnzwa"
        private_key   = {
          fingerprint = "7d:23:00:24:69:3f:11:7e:27:54:e4:99:11:3d:40:26"
          path        = "/home/chris/.oci/laptop.pem"
        }
      }
      ocid            = "ocid1.tenancy.oc1..aaaaaaaaoippwjwue735k7xzktpyu4nhabproqr4uxsmd7imgqhj33leyt5q"
    }
  }
}