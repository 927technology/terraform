variable "tenancy" {
  type                  = map(any)
  default               = {
    oci                 = {
      user              = {
        name            = "chrismurray092776"
        id              = "ocid1.user.oc1..aaaaaaaauxfnrm7b4xasw3zimyksfkqgxvt5xtr63vvx2igxka4inwqxnzwa"
        private_key     = {
          fingerprint   = "a5:3e:f4:34:58:8d:86:e1:0d:42:8c:f5:eb:c4:a5:60"
          password      = "Gr@phic45"
          path          = "/home/chris/.oci/oci_api_key.pem"
        }
      }
      region            = "iad"
      defined_tags      = {}
      description       = "root compartment (psudo)"
      enable_delete     = false
      id                = "ocid1.tenancy.oc1..aaaaaaaaoippwjwue735k7xzktpyu4nhabproqr4uxsmd7imgqhj33leyt5q"
      inactive_state    = ""
      is_accessible     = false
      name              = "root"
      tags              = {
        defined         = {}
        freeform        = {
                           "label": "root"
        }
      }
      region            = "iad"
      state             = "ACTIVE"
      time_created      = ""
    }
    cmurray             = {
      user              = {
        name            = "cmurray"
        id              = "ocid1.user.oc1..aaaaaaaadu4jgakruulnd6xvtyfmj42xsfow5fujmzm72dboi6qtzrkea27a"
        private_key     = {
          fingerprint   = "a5:3e:f4:34:58:8d:86:e1:0d:42:8c:f5:eb:c4:a5:60"
          password      = "Gr@phic45"
          path          = "/home/chris/.oci/oci_api_key.pem"
        }
      }
      defined_tags      = {}
      description       = "root compartment (psudo)"
      enable_delete     = false
      id                = "ocid1.tenancy.oc1..aaaaaaaa4k7ux473pugxgzjasoae2ej2ya3kdvemxnuveimz4qfo3orssmeq"
      inactive_state    = ""
      is_accessible     = false
      name              = "root"
      tags              = {
        defined         = {}
        freeform        = {
                           "label": "root"
        }
      }
      region            = "iad"
      state             = "ACTIVE"
      time_created      = ""
    }
  }
}