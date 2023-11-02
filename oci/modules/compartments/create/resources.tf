data "oci_identity_compartments"    "list-d0"   {
  access_level                    = var.access_level
  compartment_id                  = var.tenancy_map.id
  compartment_id_in_subtree       = true
  depends_on                      = []
  name                            = var.name
  state                           = var.state

  filter {
    name                          = "freeform_tags.tf"
    values                        = [
                                      true
    ]                                  
  }
}

resource "oci_identity_compartment" "v0_1_1-d1" {
  ##v0.1.1
  for_each                        = { 
    for setting in var.et_map.compartments :
      setting.label => setting

    if  ( 
        var.default_map.modules.compartments.enable         == true             &&                  #is the default module enabled
        var.et_map.modules.compartments.enable              == true             &&
        setting.enable                                      == true             &&                  #is the et module enabled
        setting.depth                                       == 1                &&
        ((var.default_map.modules.compartments.version      == "0.1.1"          &&                  #is the et module version 0.1.0 OR
          var.et_map.modules.compartments.version           == null     )       ||
          (var.et_map.modules.compartments.version          == "0.1.1"  )
        )
      )
  }
  
  compartment_id                    = var.tenancy_map.id
  #defined_tags                      = each.value.compartment.defined_tags
  depends_on                        = [
                                        data.oci_identity_compartments.list-d0
  ]
  description                       = each.value.description
  enable_delete                     = each.value.enable_delete
  
  freeform_tags                     = { 
    "tf"                            = true
    "depth"                         = each.value.depth
    "label"                         = each.value.label
    "timestamp"                     = (
      try(var.compartments_map[each.value.label].freeform_tags.state, timestamp())
    ) 
  }

  name                              = ( 
                                                                                                    #names with no prefix or suffix
      length(each.value.prefix)                             == 0                && 
      length(each.value.suffix)                             == 0                && 
      length(var.default_map["compartments"].prefix)        == 0                && 
      length(var.default_map["compartments"].suffix)        == 0                ? ( 
        each.value.name
    ) : (
                                                                                                    #names with compartment prefix and no suffix
      length(each.value.prefix)                             == 1                &&
      length(each.value.suffix)                             == 0                &&
      length(var.default_map["compartments"].suffix)        == 0                ? ( 
        "${each.value.prefix[0]}-${each.value.name}"
    ) : (
      length(each.value.prefix)                             >= 2                &&
      length(each.value.suffix)                             == 0                &&
      length(var.default_map["compartments"].suffix)        == 0                ? ( 
        "${each.value.prefix[0]}-${each.value.prefix[1]}-${each.value.name}"
    ) : (
                                                                                                    #names with compartment prefix and compartment suffix
      length(each.value.prefix)                             == 1                &&
      length(each.value.suffix)                             >= 1                ? (
        "${each.value.prefix[0]}-${each.value.name}-${each.value.suffix[0]}"
    ) : (
      length(each.value.prefix)                             >= 2                &&
      length(each.value.suffix)                             >= 1                ? (
        "${each.value.prefix[0]}-${each.value.prefix[1]}-${each.value.name}-${each.value.suffix[0]}"
    ) : (
                                                                                                    #names with compartment prefix and default suffix
      length(each.value.prefix)                             == 1                &&
      length(each.value.suffix)                             == 0                &&
      length(var.default_map["compartments"].suffix)        >= 1                ? (
        "${each.value.prefix[0]}-${each.value.name}-${var.default_map["compartments"].suffix[0]}"
    ) : (
      length(each.value.prefix)                             >= 2                &&
      length(each.value.suffix)                             == 0                &&
      length(var.default_map["compartments"].suffix)        >= 1                ? (
        "${each.value.prefix[0]}-${each.value.prefix[1]}-${each.value.name}-${var.default_map["compartments"].suffix[0]}"
    ) : (
      length(each.value.prefix)                             == 0                && 
      length(each.value.suffix)                             == 0                && 
      length(var.default_map["compartments"].prefix)        == 1                &&
      length(var.default_map["compartments"].suffix)        == 0                ? (
        "${var.default_map["compartments"].prefix[0]}-${each.value.name}"
    ) : (
      length(each.value.prefix)                             == 0                && 
      length(each.value.suffix)                             == 0                && 
      length(var.default_map["compartments"].prefix)        >= 2                &&
      length(var.default_map["compartments"].suffix)        == 0                ? (
        "${var.default_map["compartments"].prefix[0]}-${var.default_map["compartments"].prefix[1]}-${each.value.name}-${each.value.suffix[0]}"
    ) : (
                                                                                                    #names with default prefix and compartment suffix
      length(each.value.prefix)                             == 0                && 
      length(each.value.suffix)                             >= 1                && 
      length(var.default_map["compartments"].prefix)        == 1                &&
      length(var.default_map["compartments"].suffix)        == 0                ? (
        "${var.default_map["compartments"].prefix[0]}-${each.value.name}-${each.value.suffix[0]}"
    ) : (
      length(each.value.prefix)                             == 0                && 
      length(each.value.suffix)                             >= 1                && 
      length(var.default_map["compartments"].prefix)        >= 2                &&
      length(var.default_map["compartments"].suffix)        == 0                ? (
        "${var.default_map["compartments"].prefix[0]}-${var.default_map["compartments"].prefix[1]}-${each.value.name}-${each.value.suffix[0]}"
    ) : (
                                                                                                    #names with default prefix and default suffix
      length(each.value.prefix)                             == 0                && 
      length(each.value.suffix)                             == 0                && 
      length(var.default_map["compartments"].prefix)        == 1                &&
      length(var.default_map["compartments"].suffix)        >= 1                ? (
        "${var.default_map["compartments"].prefix[0]}-${each.value.name}-${var.default_map["compartments"].suffix[0]}"
    ) : (
      length(each.value.prefix)                             == 0                && 
      length(each.value.suffix)                             == 0                && 
      length(var.default_map["compartments"].prefix)        >= 2                &&
      length(var.default_map["compartments"].suffix)        >= 1                ? (
        "${var.default_map["compartments"].prefix[0]}-${var.default_map["compartments"].prefix[1]}-${each.value.name}-${var.default_map["compartments"].suffix[0]}"
    ) : (
                                                                                                    #names with default prefix
      length(each.value.prefix)                             == 0                && 
      length(each.value.suffix)                             == 0                && 
      length(var.default_map["compartments"].prefix)        == 1                &&
      length(var.default_map["compartments"].suffix)        >= 1                ? (
        "${var.default_map["compartments"].prefix[0]}-${var.default_map["compartments"].prefix[1]}-${each.value.name}-${var.default_map["compartments"].suffix[0]}"
    ) : (

      length(each.value.prefix)                             == 0                && 
      length(each.value.suffix)                             == 0                && 
      length(var.default_map["compartments"].prefix)        >= 2                &&
      length(var.default_map["compartments"].suffix)        >= 0                ? (
        "${var.default_map["compartments"].prefix[0]}-${var.default_map["compartments"].prefix[1]}-${each.value.name}-${var.default_map["compartments"].suffix[0]}"
    ) : (

                                                                                                    #names with default suffix
      length(each.value.prefix)                             == 0                && 
      length(each.value.suffix)                             == 0                && 
      length(var.default_map["compartments"].prefix)        == 0                &&
      length(var.default_map["compartments"].suffix)        >= 1                ? (
        "${each.value.name}-${var.default_map["compartments"].suffix[0]}"
    ) : (
                                                                                                    #yup you screwed up!
        "you should not see this"
  )))))))))))))))))

  /*
  provisioner "local-exec"          {                                                               #wait let things bake in
    interpreter                     = ["bash", "-c"]
    command                         = "sleep 10"
  }
  */
}

data "oci_identity_compartments"    "list-d1"   {
  access_level                    = var.access_level
  compartment_id                  = var.tenancy_map.id
  compartment_id_in_subtree       = true
  depends_on                      = [
                                      data.oci_identity_compartments.list-d0,
                                      oci_identity_compartment.v0_1_1-d1
  ]
  name                            = var.name
  state                           = var.state

  filter {
    name                          = "freeform_tags.tf"
    values                        = [
                                      true
    ]
  }
}

resource "oci_identity_compartment" "v0_1_1-d2" {
  ##v0.1.1
  for_each                        = { 
    for setting in var.et_map.compartments :
      setting.label => setting

    if  ( var.default_map.modules.compartments.enable       == true             &&                  #is the default module enabled
          var.et_map.modules.compartments.enable            == true             &&
          setting.enable                                    == true             &&                  #is the et module enabled
          setting.depth                                     == 2                &&
          ((var.default_map.modules.compartments.version    == "0.1.1"          &&                  #is the et module version 0.1.0 OR
            var.et_map.modules.compartments.version         == null     )       ||
           (var.et_map.modules.compartments.version         == "0.1.1"  )
          )
        )
  }
  
  compartment_id                    = (
    data.oci_identity_compartments.list-d1.compartments[
      index(data.oci_identity_compartments.list-d1.compartments.*.freeform_tags.label, each.value.parent)
    ].id
  )

  #defined_tags                      = each.value.compartment.defined_tags
  depends_on                        = [
                                        data.oci_identity_compartments.list-d0,
                                        data.oci_identity_compartments.list-d1,
                                        oci_identity_compartment.v0_1_1-d1
  ]
  description                       = each.value.description
  enable_delete                     = each.value.enable_delete
  
  freeform_tags                     = { 
    "tf"                            = true
    "depth"                         = each.value.depth
    "label"                         = each.value.label
    "timestamp"                     = (
      try(var.compartments_map[each.value.label].freeform_tags.state, timestamp())
    ) 
  }

  name                              = ( 
                                                                                                    #names with no prefix or suffix
      length(each.value.prefix)                             == 0                && 
      length(each.value.suffix)                             == 0                && 
      length(var.default_map["compartments"].prefix)        == 0                && 
      length(var.default_map["compartments"].suffix)        == 0                ? ( 
        each.value.name
    ) : (
                                                                                                    #names with compartment prefix and no suffix
      length(each.value.prefix)                             == 1                &&
      length(each.value.suffix)                             == 0                &&
      length(var.default_map["compartments"].suffix)        == 0                ? ( 
        "${each.value.prefix[0]}-${each.value.name}"
    ) : (
      length(each.value.prefix)                             >= 2                &&
      length(each.value.suffix)                             == 0                &&
      length(var.default_map["compartments"].suffix)        == 0                ? ( 
        "${each.value.prefix[0]}-${each.value.prefix[1]}-${each.value.name}"
    ) : (
                                                                                                    #names with compartment prefix and compartment suffix
      length(each.value.prefix)                             == 1                &&
      length(each.value.suffix)                             >= 1                ? (
        "${each.value.prefix[0]}-${each.value.name}-${each.value.suffix[0]}"
    ) : (
      length(each.value.prefix)                             >= 2                &&
      length(each.value.suffix)                             >= 1                ? (
        "${each.value.prefix[0]}-${each.value.prefix[1]}-${each.value.name}-${each.value.suffix[0]}"
    ) : (
                                                                                                    #names with compartment prefix and default suffix
      length(each.value.prefix)                             == 1                &&
      length(each.value.suffix)                             == 0                &&
      length(var.default_map["compartments"].suffix)        >= 1                ? (
        "${each.value.prefix[0]}-${each.value.name}-${var.default_map["compartments"].suffix[0]}"
    ) : (
      length(each.value.prefix)                             >= 2                &&
      length(each.value.suffix)                             == 0                &&
      length(var.default_map["compartments"].suffix)        >= 1                ? (
        "${each.value.prefix[0]}-${each.value.prefix[1]}-${each.value.name}-${var.default_map["compartments"].suffix[0]}"
    ) : (
      length(each.value.prefix)                             == 0                && 
      length(each.value.suffix)                             == 0                && 
      length(var.default_map["compartments"].prefix)        == 1                &&
      length(var.default_map["compartments"].suffix)        == 0                ? (
        "${var.default_map["compartments"].prefix[0]}-${each.value.name}"
    ) : (
      length(each.value.prefix)                             == 0                && 
      length(each.value.suffix)                             == 0                && 
      length(var.default_map["compartments"].prefix)        >= 2                &&
      length(var.default_map["compartments"].suffix)        == 0                ? (
        "${var.default_map["compartments"].prefix[0]}-${var.default_map["compartments"].prefix[1]}-${each.value.name}-${each.value.suffix[0]}"
    ) : (
                                                                                                    #names with default prefix and compartment suffix
      length(each.value.prefix)                             == 0                && 
      length(each.value.suffix)                             >= 1                && 
      length(var.default_map["compartments"].prefix)        == 1                &&
      length(var.default_map["compartments"].suffix)        == 0                ? (
        "${var.default_map["compartments"].prefix[0]}-${each.value.name}-${each.value.suffix[0]}"
    ) : (
      length(each.value.prefix)                             == 0                && 
      length(each.value.suffix)                             >= 1                && 
      length(var.default_map["compartments"].prefix)        >= 2                &&
      length(var.default_map["compartments"].suffix)        == 0                ? (
        "${var.default_map["compartments"].prefix[0]}-${var.default_map["compartments"].prefix[1]}-${each.value.name}-${each.value.suffix[0]}"
    ) : (
                                                                                                    #names with default prefix and default suffix
      length(each.value.prefix)                             == 0                && 
      length(each.value.suffix)                             == 0                && 
      length(var.default_map["compartments"].prefix)        == 1                &&
      length(var.default_map["compartments"].suffix)        >= 1                ? (
        "${var.default_map["compartments"].prefix[0]}-${each.value.name}-${var.default_map["compartments"].suffix[0]}"
    ) : (
      length(each.value.prefix)                             == 0                && 
      length(each.value.suffix)                             == 0                && 
      length(var.default_map["compartments"].prefix)        >= 2                &&
      length(var.default_map["compartments"].suffix)        >= 1                ? (
        "${var.default_map["compartments"].prefix[0]}-${var.default_map["compartments"].prefix[1]}-${each.value.name}-${var.default_map["compartments"].suffix[0]}"
    ) : (
                                                                                                    #names with default prefix
      length(each.value.prefix)                             == 0                && 
      length(each.value.suffix)                             == 0                && 
      length(var.default_map["compartments"].prefix)        == 1                &&
      length(var.default_map["compartments"].suffix)        >= 1                ? (
        "${var.default_map["compartments"].prefix[0]}-${var.default_map["compartments"].prefix[1]}-${each.value.name}-${var.default_map["compartments"].suffix[0]}"
    ) : (

      length(each.value.prefix)                             == 0                && 
      length(each.value.suffix)                             == 0                && 
      length(var.default_map["compartments"].prefix)        >= 2                &&
      length(var.default_map["compartments"].suffix)        >= 0                ? (
        "${var.default_map["compartments"].prefix[0]}-${var.default_map["compartments"].prefix[1]}-${each.value.name}-${var.default_map["compartments"].suffix[0]}"
    ) : (

                                                                                                    #names with default suffix
      length(each.value.prefix)                             == 0                && 
      length(each.value.suffix)                             == 0                && 
      length(var.default_map["compartments"].prefix)        == 0                &&
      length(var.default_map["compartments"].suffix)        >= 1                ? (
        "${each.value.name}-${var.default_map["compartments"].suffix[0]}"
    ) : (
                                                                                                    #yup you screwed up!
        "you should not see this"
  )))))))))))))))))

  /*
  provisioner "local-exec"          {                                                               #wait let things bake in
    interpreter                     = ["bash", "-c"]
    command                         = "sleep 10"
  }
  */
}

data "oci_identity_compartments"    "list-d2"   {
  access_level                      = var.access_level
  compartment_id                    = var.tenancy_map.id
  compartment_id_in_subtree         = true
  depends_on                        = [
                                        data.oci_identity_compartments.list-d0,
                                        data.oci_identity_compartments.list-d1,
                                        oci_identity_compartment.v0_1_1-d1,
                                        oci_identity_compartment.v0_1_1-d2
  ]
  name                              = var.name
  state                             = var.state

  filter {
    name                            = "freeform_tags.tf"
    values                          = [
                                        true
    ]
  }
}

resource "oci_identity_compartment" "v0_1_1-d3" {
  ##v0.1.1
  for_each                        = { 
    for setting in var.et_map.compartments :
      setting.label => setting

    if  ( var.default_map.modules.compartments.enable       == true             &&                  #is the default module enabled
          var.et_map.modules.compartments.enable            == true             &&
          setting.enable                                    == true             &&                  #is the et module enabled
          setting.depth                                     == 3                &&
          ((var.default_map.modules.compartments.version    == "0.1.1"          &&                  #is the et module version 0.1.0 OR
            var.et_map.modules.compartments.version         == null     )       ||
           (var.et_map.modules.compartments.version         == "0.1.1"  )
          )
        )
  }
  
  compartment_id                    = (
    data.oci_identity_compartments.list-d2.compartments[
      index(data.oci_identity_compartments.list-d2.compartments.*.freeform_tags.label, each.value.parent)
    ].id
  )

  #defined_tags                      = each.value.compartment.defined_tags
  depends_on                        = [
                                        data.oci_identity_compartments.list-d0,
                                        data.oci_identity_compartments.list-d1,
                                        data.oci_identity_compartments.list-d2,
                                        oci_identity_compartment.v0_1_1-d1,
                                        oci_identity_compartment.v0_1_1-d2
  ]
  description                       = each.value.description
  enable_delete                     = each.value.enable_delete
  
  freeform_tags                     = { 
    "tf"                            = true
    "depth"                         = each.value.depth
    "label"                         = each.value.label
    "timestamp"                     = (
      try(var.compartments_map[each.value.label].freeform_tags.state, timestamp())
    ) 
  }

  name                              = ( 
                                                                                                    #names with no prefix or suffix
      length(each.value.prefix)                             == 0                && 
      length(each.value.suffix)                             == 0                && 
      length(var.default_map["compartments"].prefix)        == 0                && 
      length(var.default_map["compartments"].suffix)        == 0                ? ( 
        each.value.name
    ) : (
                                                                                                    #names with compartment prefix and no suffix
      length(each.value.prefix)                             == 1                &&
      length(each.value.suffix)                             == 0                &&
      length(var.default_map["compartments"].suffix)        == 0                ? ( 
        "${each.value.prefix[0]}-${each.value.name}"
    ) : (
      length(each.value.prefix)                             >= 2                &&
      length(each.value.suffix)                             == 0                &&
      length(var.default_map["compartments"].suffix)        == 0                ? ( 
        "${each.value.prefix[0]}-${each.value.prefix[1]}-${each.value.name}"
    ) : (
                                                                                                    #names with compartment prefix and compartment suffix
      length(each.value.prefix)                             == 1                &&
      length(each.value.suffix)                             >= 1                ? (
        "${each.value.prefix[0]}-${each.value.name}-${each.value.suffix[0]}"
    ) : (
      length(each.value.prefix)                             >= 2                &&
      length(each.value.suffix)                             >= 1                ? (
        "${each.value.prefix[0]}-${each.value.prefix[1]}-${each.value.name}-${each.value.suffix[0]}"
    ) : (
                                                                                                    #names with compartment prefix and default suffix
      length(each.value.prefix)                             == 1                &&
      length(each.value.suffix)                             == 0                &&
      length(var.default_map["compartments"].suffix)        >= 1                ? (
        "${each.value.prefix[0]}-${each.value.name}-${var.default_map["compartments"].suffix[0]}"
    ) : (
      length(each.value.prefix)                             >= 2                &&
      length(each.value.suffix)                             == 0                &&
      length(var.default_map["compartments"].suffix)        >= 1                ? (
        "${each.value.prefix[0]}-${each.value.prefix[1]}-${each.value.name}-${var.default_map["compartments"].suffix[0]}"
    ) : (
      length(each.value.prefix)                             == 0                && 
      length(each.value.suffix)                             == 0                && 
      length(var.default_map["compartments"].prefix)        == 1                &&
      length(var.default_map["compartments"].suffix)        == 0                ? (
        "${var.default_map["compartments"].prefix[0]}-${each.value.name}"
    ) : (
      length(each.value.prefix)                             == 0                && 
      length(each.value.suffix)                             == 0                && 
      length(var.default_map["compartments"].prefix)        >= 2                &&
      length(var.default_map["compartments"].suffix)        == 0                ? (
        "${var.default_map["compartments"].prefix[0]}-${var.default_map["compartments"].prefix[1]}-${each.value.name}-${each.value.suffix[0]}"
    ) : (
                                                                                                    #names with default prefix and compartment suffix
      length(each.value.prefix)                             == 0                && 
      length(each.value.suffix)                             >= 1                && 
      length(var.default_map["compartments"].prefix)        == 1                &&
      length(var.default_map["compartments"].suffix)        == 0                ? (
        "${var.default_map["compartments"].prefix[0]}-${each.value.name}-${each.value.suffix[0]}"
    ) : (
      length(each.value.prefix)                             == 0                && 
      length(each.value.suffix)                             >= 1                && 
      length(var.default_map["compartments"].prefix)        >= 2                &&
      length(var.default_map["compartments"].suffix)        == 0                ? (
        "${var.default_map["compartments"].prefix[0]}-${var.default_map["compartments"].prefix[1]}-${each.value.name}-${each.value.suffix[0]}"
    ) : (
                                                                                                    #names with default prefix and default suffix
      length(each.value.prefix)                             == 0                && 
      length(each.value.suffix)                             == 0                && 
      length(var.default_map["compartments"].prefix)        == 1                &&
      length(var.default_map["compartments"].suffix)        >= 1                ? (
        "${var.default_map["compartments"].prefix[0]}-${each.value.name}-${var.default_map["compartments"].suffix[0]}"
    ) : (
      length(each.value.prefix)                             == 0                && 
      length(each.value.suffix)                             == 0                && 
      length(var.default_map["compartments"].prefix)        >= 2                &&
      length(var.default_map["compartments"].suffix)        >= 1                ? (
        "${var.default_map["compartments"].prefix[0]}-${var.default_map["compartments"].prefix[1]}-${each.value.name}-${var.default_map["compartments"].suffix[0]}"
    ) : (
                                                                                                    #names with default prefix
      length(each.value.prefix)                             == 0                && 
      length(each.value.suffix)                             == 0                && 
      length(var.default_map["compartments"].prefix)        == 1                &&
      length(var.default_map["compartments"].suffix)        >= 1                ? (
        "${var.default_map["compartments"].prefix[0]}-${var.default_map["compartments"].prefix[1]}-${each.value.name}-${var.default_map["compartments"].suffix[0]}"
    ) : (

      length(each.value.prefix)                             == 0                && 
      length(each.value.suffix)                             == 0                && 
      length(var.default_map["compartments"].prefix)        >= 2                &&
      length(var.default_map["compartments"].suffix)        >= 0                ? (
        "${var.default_map["compartments"].prefix[0]}-${var.default_map["compartments"].prefix[1]}-${each.value.name}-${var.default_map["compartments"].suffix[0]}"
    ) : (

                                                                                                    #names with default suffix
      length(each.value.prefix)                             == 0                && 
      length(each.value.suffix)                             == 0                && 
      length(var.default_map["compartments"].prefix)        == 0                &&
      length(var.default_map["compartments"].suffix)        >= 1                ? (
        "${each.value.name}-${var.default_map["compartments"].suffix[0]}"
    ) : (
                                                                                                    #yup you screwed up!
        "you should not see this"
  )))))))))))))))))

  /*
  provisioner "local-exec"          {                                                               #wait let things bake in
    interpreter                     = ["bash", "-c"]
    command                         = "sleep 10"
  }
  */
}

data "oci_identity_compartments"    "list-d3"   {
  access_level                      = var.access_level
  compartment_id                    = var.tenancy_map.id
  compartment_id_in_subtree         = true
  depends_on                        = [
                                        data.oci_identity_compartments.list-d0,
                                        data.oci_identity_compartments.list-d1,
                                        data.oci_identity_compartments.list-d2,
                                        oci_identity_compartment.v0_1_1-d1,
                                        oci_identity_compartment.v0_1_1-d2,
                                        oci_identity_compartment.v0_1_1-d3
  ]
  name                              = var.name
  state                             = var.state

  filter {
    name                            = "freeform_tags.tf"
    values                          = [
                                        true
    ]
  }
}

resource "oci_identity_compartment" "v0_1_1-d4" {
  ##v0.1.1
  for_each                        = { 
    for setting in var.et_map.compartments :
      setting.label => setting

    if  ( var.default_map.modules.compartments.enable       == true             &&                  #is the default module enabled
          var.et_map.modules.compartments.enable            == true             &&
          setting.enable                                    == true             &&                  #is the et module enabled
          setting.depth                                     == 4                &&
          ((var.default_map.modules.compartments.version    == "0.1.1"          &&                  #is the et module version 0.1.0 OR
            var.et_map.modules.compartments.version         == null     )       ||
           (var.et_map.modules.compartments.version         == "0.1.1"  )
          )
        )
  }
  
  compartment_id                    = (
    data.oci_identity_compartments.list-d3.compartments[
      index(data.oci_identity_compartments.list-d3.compartments.*.freeform_tags.label, each.value.parent)
    ].id
  )

  #defined_tags                      = each.value.compartment.defined_tags
  depends_on                        = [
                                        data.oci_identity_compartments.list-d0,
                                        data.oci_identity_compartments.list-d1,
                                        data.oci_identity_compartments.list-d2,
                                        data.oci_identity_compartments.list-d3,
                                        oci_identity_compartment.v0_1_1-d1,
                                        oci_identity_compartment.v0_1_1-d2,
                                        oci_identity_compartment.v0_1_1-d3
  ]
  description                       = each.value.description
  enable_delete                     = each.value.enable_delete
  
  freeform_tags                     = { 
    "tf"                            = true
    "depth"                         = each.value.depth
    "label"                         = each.value.label
    "timestamp"                     = (
      try(var.compartments_map[each.value.label].freeform_tags.state, timestamp())
    ) 
  }

  name                              = ( 
                                                                                                    #names with no prefix or suffix
      length(each.value.prefix)                             == 0                && 
      length(each.value.suffix)                             == 0                && 
      length(var.default_map["compartments"].prefix)        == 0                && 
      length(var.default_map["compartments"].suffix)        == 0                ? ( 
        each.value.name
    ) : (
                                                                                                    #names with compartment prefix and no suffix
      length(each.value.prefix)                             == 1                &&
      length(each.value.suffix)                             == 0                &&
      length(var.default_map["compartments"].suffix)        == 0                ? ( 
        "${each.value.prefix[0]}-${each.value.name}"
    ) : (
      length(each.value.prefix)                             >= 2                &&
      length(each.value.suffix)                             == 0                &&
      length(var.default_map["compartments"].suffix)        == 0                ? ( 
        "${each.value.prefix[0]}-${each.value.prefix[1]}-${each.value.name}"
    ) : (
                                                                                                    #names with compartment prefix and compartment suffix
      length(each.value.prefix)                             == 1                &&
      length(each.value.suffix)                             >= 1                ? (
        "${each.value.prefix[0]}-${each.value.name}-${each.value.suffix[0]}"
    ) : (
      length(each.value.prefix)                             >= 2                &&
      length(each.value.suffix)                             >= 1                ? (
        "${each.value.prefix[0]}-${each.value.prefix[1]}-${each.value.name}-${each.value.suffix[0]}"
    ) : (
                                                                                                    #names with compartment prefix and default suffix
      length(each.value.prefix)                             == 1                &&
      length(each.value.suffix)                             == 0                &&
      length(var.default_map["compartments"].suffix)        >= 1                ? (
        "${each.value.prefix[0]}-${each.value.name}-${var.default_map["compartments"].suffix[0]}"
    ) : (
      length(each.value.prefix)                             >= 2                &&
      length(each.value.suffix)                             == 0                &&
      length(var.default_map["compartments"].suffix)        >= 1                ? (
        "${each.value.prefix[0]}-${each.value.prefix[1]}-${each.value.name}-${var.default_map["compartments"].suffix[0]}"
    ) : (
      length(each.value.prefix)                             == 0                && 
      length(each.value.suffix)                             == 0                && 
      length(var.default_map["compartments"].prefix)        == 1                &&
      length(var.default_map["compartments"].suffix)        == 0                ? (
        "${var.default_map["compartments"].prefix[0]}-${each.value.name}"
    ) : (
      length(each.value.prefix)                             == 0                && 
      length(each.value.suffix)                             == 0                && 
      length(var.default_map["compartments"].prefix)        >= 2                &&
      length(var.default_map["compartments"].suffix)        == 0                ? (
        "${var.default_map["compartments"].prefix[0]}-${var.default_map["compartments"].prefix[1]}-${each.value.name}-${each.value.suffix[0]}"
    ) : (
                                                                                                    #names with default prefix and compartment suffix
      length(each.value.prefix)                             == 0                && 
      length(each.value.suffix)                             >= 1                && 
      length(var.default_map["compartments"].prefix)        == 1                &&
      length(var.default_map["compartments"].suffix)        == 0                ? (
        "${var.default_map["compartments"].prefix[0]}-${each.value.name}-${each.value.suffix[0]}"
    ) : (
      length(each.value.prefix)                             == 0                && 
      length(each.value.suffix)                             >= 1                && 
      length(var.default_map["compartments"].prefix)        >= 2                &&
      length(var.default_map["compartments"].suffix)        == 0                ? (
        "${var.default_map["compartments"].prefix[0]}-${var.default_map["compartments"].prefix[1]}-${each.value.name}-${each.value.suffix[0]}"
    ) : (
                                                                                                    #names with default prefix and default suffix
      length(each.value.prefix)                             == 0                && 
      length(each.value.suffix)                             == 0                && 
      length(var.default_map["compartments"].prefix)        == 1                &&
      length(var.default_map["compartments"].suffix)        >= 1                ? (
        "${var.default_map["compartments"].prefix[0]}-${each.value.name}-${var.default_map["compartments"].suffix[0]}"
    ) : (
      length(each.value.prefix)                             == 0                && 
      length(each.value.suffix)                             == 0                && 
      length(var.default_map["compartments"].prefix)        >= 2                &&
      length(var.default_map["compartments"].suffix)        >= 1                ? (
        "${var.default_map["compartments"].prefix[0]}-${var.default_map["compartments"].prefix[1]}-${each.value.name}-${var.default_map["compartments"].suffix[0]}"
    ) : (
                                                                                                    #names with default prefix
      length(each.value.prefix)                             == 0                && 
      length(each.value.suffix)                             == 0                && 
      length(var.default_map["compartments"].prefix)        == 1                &&
      length(var.default_map["compartments"].suffix)        >= 1                ? (
        "${var.default_map["compartments"].prefix[0]}-${var.default_map["compartments"].prefix[1]}-${each.value.name}-${var.default_map["compartments"].suffix[0]}"
    ) : (

      length(each.value.prefix)                             == 0                && 
      length(each.value.suffix)                             == 0                && 
      length(var.default_map["compartments"].prefix)        >= 2                &&
      length(var.default_map["compartments"].suffix)        >= 0                ? (
        "${var.default_map["compartments"].prefix[0]}-${var.default_map["compartments"].prefix[1]}-${each.value.name}-${var.default_map["compartments"].suffix[0]}"
    ) : (

                                                                                                    #names with default suffix
      length(each.value.prefix)                             == 0                && 
      length(each.value.suffix)                             == 0                && 
      length(var.default_map["compartments"].prefix)        == 0                &&
      length(var.default_map["compartments"].suffix)        >= 1                ? (
        "${each.value.name}-${var.default_map["compartments"].suffix[0]}"
    ) : (
                                                                                                    #yup you screwed up!
        "you should not see this"
  )))))))))))))))))

  /*
  provisioner "local-exec"          {                                                               #wait let things bake in
    interpreter                     = ["bash", "-c"]
    command                         = "sleep 10"
  }
  */
}

data "oci_identity_compartments"    "list-d4"   {
  access_level                      = var.access_level
  compartment_id                    = var.tenancy_map.id
  compartment_id_in_subtree         = true
  depends_on                        = [
                                        data.oci_identity_compartments.list-d0,
                                        data.oci_identity_compartments.list-d1,
                                        data.oci_identity_compartments.list-d2,
                                        data.oci_identity_compartments.list-d3,
                                        oci_identity_compartment.v0_1_1-d1,
                                        oci_identity_compartment.v0_1_1-d2,
                                        oci_identity_compartment.v0_1_1-d3,
                                        oci_identity_compartment.v0_1_1-d4
  ]
  name                              = var.name
  state                             = var.state

  filter {
    name                            = "freeform_tags.tf"
    values                          = [
                                        true
    ]
  }
}

resource "oci_identity_compartment" "v0_1_1-d5" {
  ##v0.1.1
  for_each                        = { 
    for setting in var.et_map.compartments :
      setting.label => setting

    if  ( var.default_map.modules.compartments.enable       == true             &&                  #is the default module enabled
          var.et_map.modules.compartments.enable            == true             &&
          setting.enable                                    == true             &&                  #is the et module enabled
          setting.depth                                     == 5                &&
          ((var.default_map.modules.compartments.version    == "0.1.1"          &&                  #is the et module version 0.1.0 OR
            var.et_map.modules.compartments.version         == null     )       ||
           (var.et_map.modules.compartments.version         == "0.1.1"  )
          )
        )
  }
  
  compartment_id                    = (
    data.oci_identity_compartments.list-d4.compartments[
      index(data.oci_identity_compartments.list-d4.compartments.*.freeform_tags.label, each.value.parent)
    ].id
  )

  #defined_tags                      = each.value.compartment.defined_tags
  depends_on                        = [
                                        data.oci_identity_compartments.list-d0,
                                        data.oci_identity_compartments.list-d1,
                                        data.oci_identity_compartments.list-d2,
                                        data.oci_identity_compartments.list-d3,
                                        data.oci_identity_compartments.list-d4,
                                        oci_identity_compartment.v0_1_1-d1,
                                        oci_identity_compartment.v0_1_1-d2,
                                        oci_identity_compartment.v0_1_1-d3,
                                        oci_identity_compartment.v0_1_1-d4
  ]
  description                       = each.value.description
  enable_delete                     = each.value.enable_delete
  
  freeform_tags                     = { 
    "tf"                            = true
    "depth"                         = each.value.depth
    "label"                         = each.value.label
    "timestamp"                     = timestamp()
  }

  name                              = ( 
                                                                                                    #names with no prefix or suffix
      length(each.value.prefix)                             == 0                && 
      length(each.value.suffix)                             == 0                && 
      length(var.default_map["compartments"].prefix)        == 0                && 
      length(var.default_map["compartments"].suffix)        == 0                ? ( 
        each.value.name
    ) : (
                                                                                                    #names with compartment prefix and no suffix
      length(each.value.prefix)                             == 1                &&
      length(each.value.suffix)                             == 0                &&
      length(var.default_map["compartments"].suffix)        == 0                ? ( 
        "${each.value.prefix[0]}-${each.value.name}"
    ) : (
      length(each.value.prefix)                             >= 2                &&
      length(each.value.suffix)                             == 0                &&
      length(var.default_map["compartments"].suffix)        == 0                ? ( 
        "${each.value.prefix[0]}-${each.value.prefix[1]}-${each.value.name}"
    ) : (
                                                                                                    #names with compartment prefix and compartment suffix
      length(each.value.prefix)                             == 1                &&
      length(each.value.suffix)                             >= 1                ? (
        "${each.value.prefix[0]}-${each.value.name}-${each.value.suffix[0]}"
    ) : (
      length(each.value.prefix)                             >= 2                &&
      length(each.value.suffix)                             >= 1                ? (
        "${each.value.prefix[0]}-${each.value.prefix[1]}-${each.value.name}-${each.value.suffix[0]}"
    ) : (
                                                                                                    #names with compartment prefix and default suffix
      length(each.value.prefix)                             == 1                &&
      length(each.value.suffix)                             == 0                &&
      length(var.default_map["compartments"].suffix)        >= 1                ? (
        "${each.value.prefix[0]}-${each.value.name}-${var.default_map["compartments"].suffix[0]}"
    ) : (
      length(each.value.prefix)                             >= 2                &&
      length(each.value.suffix)                             == 0                &&
      length(var.default_map["compartments"].suffix)        >= 1                ? (
        "${each.value.prefix[0]}-${each.value.prefix[1]}-${each.value.name}-${var.default_map["compartments"].suffix[0]}"
    ) : (
      length(each.value.prefix)                             == 0                && 
      length(each.value.suffix)                             == 0                && 
      length(var.default_map["compartments"].prefix)        == 1                &&
      length(var.default_map["compartments"].suffix)        == 0                ? (
        "${var.default_map["compartments"].prefix[0]}-${each.value.name}"
    ) : (
      length(each.value.prefix)                             == 0                && 
      length(each.value.suffix)                             == 0                && 
      length(var.default_map["compartments"].prefix)        >= 2                &&
      length(var.default_map["compartments"].suffix)        == 0                ? (
        "${var.default_map["compartments"].prefix[0]}-${var.default_map["compartments"].prefix[1]}-${each.value.name}-${each.value.suffix[0]}"
    ) : (
                                                                                                    #names with default prefix and compartment suffix
      length(each.value.prefix)                             == 0                && 
      length(each.value.suffix)                             >= 1                && 
      length(var.default_map["compartments"].prefix)        == 1                &&
      length(var.default_map["compartments"].suffix)        == 0                ? (
        "${var.default_map["compartments"].prefix[0]}-${each.value.name}-${each.value.suffix[0]}"
    ) : (
      length(each.value.prefix)                             == 0                && 
      length(each.value.suffix)                             >= 1                && 
      length(var.default_map["compartments"].prefix)        >= 2                &&
      length(var.default_map["compartments"].suffix)        == 0                ? (
        "${var.default_map["compartments"].prefix[0]}-${var.default_map["compartments"].prefix[1]}-${each.value.name}-${each.value.suffix[0]}"
    ) : (
                                                                                                    #names with default prefix and default suffix
      length(each.value.prefix)                             == 0                && 
      length(each.value.suffix)                             == 0                && 
      length(var.default_map["compartments"].prefix)        == 1                &&
      length(var.default_map["compartments"].suffix)        >= 1                ? (
        "${var.default_map["compartments"].prefix[0]}-${each.value.name}-${var.default_map["compartments"].suffix[0]}"
    ) : (
      length(each.value.prefix)                             == 0                && 
      length(each.value.suffix)                             == 0                && 
      length(var.default_map["compartments"].prefix)        >= 2                &&
      length(var.default_map["compartments"].suffix)        >= 1                ? (
        "${var.default_map["compartments"].prefix[0]}-${var.default_map["compartments"].prefix[1]}-${each.value.name}-${var.default_map["compartments"].suffix[0]}"
    ) : (
                                                                                                    #names with default prefix
      length(each.value.prefix)                             == 0                && 
      length(each.value.suffix)                             == 0                && 
      length(var.default_map["compartments"].prefix)        == 1                &&
      length(var.default_map["compartments"].suffix)        >= 1                ? (
        "${var.default_map["compartments"].prefix[0]}-${var.default_map["compartments"].prefix[1]}-${each.value.name}-${var.default_map["compartments"].suffix[0]}"
    ) : (

      length(each.value.prefix)                             == 0                && 
      length(each.value.suffix)                             == 0                && 
      length(var.default_map["compartments"].prefix)        >= 2                &&
      length(var.default_map["compartments"].suffix)        >= 0                ? (
        "${var.default_map["compartments"].prefix[0]}-${var.default_map["compartments"].prefix[1]}-${each.value.name}-${var.default_map["compartments"].suffix[0]}"
    ) : (

                                                                                                    #names with default suffix
      length(each.value.prefix)                             == 0                && 
      length(each.value.suffix)                             == 0                && 
      length(var.default_map["compartments"].prefix)        == 0                &&
      length(var.default_map["compartments"].suffix)        >= 1                ? (
        "${each.value.name}-${var.default_map["compartments"].suffix[0]}"
    ) : (
                                                                                                    #yup you screwed up!
        "you should not see this"
  )))))))))))))))))

  /*
  provisioner "local-exec"          {                                                               #wait let things bake in
    interpreter                     = ["bash", "-c"]
    command                         = "sleep 10"
  }
  */
}