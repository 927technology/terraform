# Configuration Based Terraform

### Internet Gateway

> Current Version: 0.1.0
</br>
> Status: Test

- Configuration
  - [Example](./internet_gateway.md#example)
  - [Settings](./internet_gateway.md#settings)

- Modules: 
  - [Create](./internet_gateway.md#create)
  - [List](./internet_gateway.md#list)

- Outputs
  - [List](./internet_gateway.md#list)
  - [Map](./internet_gateway.md#map)
  - [Raw](./internet_gateway.md#raw)

### Configuration

  ```
  {
    active                = false
    compartment           = "shared-network"
    enable                = true
    label                 = "internet"
    name                  = "internet"
    prefix                = []
    route_table           = {
      label               = null
    }
    suffix                = []
    tags                  = {
      defined             = {}
      freeform            = {}
    }
    vcn                   = {
      compartment         = "shared-network"
      label               = "tenancy"
    }
  }
  ```


## Settings

  argument
    
  > description 

  - Data Type : Integer
  - Default   : None
  - Required  : Yes



## Modules

### Create

```
module "internet_gateway-create"    { # reads var.config and creates internet_gateway
  after                             = [
                                        module.compartments-create,
                                        module.vcns-create
  ]
  compartments_map                  = module.compartments-create.map
  default_map                       = var.config.et["default"].infrastructure
  depends_on                        = [
                                        module.compartments-create,
                                        module.vcns-create
  ]
  et_map                            = var.config.et[var.local.execution_target.name].infrastructure
  source                            = "./modules/internet_gateway/create"
  tenancy_map                       = var.tenancy[var.local.execution_target.name]
  vcns_map                          = module.vcns-create.vcns-map
}
```

### List

```
```

## Outputs

### list

```
```
### map

```
```

### raw

```
"internet" = {
  "compartment_id" = "ocid1.compartment.oc1...."
  "defined_tags" = {
    "Oracle-Tags.CreatedBy" = "default/cmurray@927.technology"
    "Oracle-Tags.CreatedOn" = "2023-11-08T20:59:36.975Z"
  }
  "display_name" = "internet-ig"
  "enabled" = false
  "freeform_tags" = {
    "label" = "internet"
    "tf" = "true"
    "timestamp" = "2023-11-12T02:56:01Z"
    "vcn_label" = "tenancy"
  }
  "id" = "ocid1.internetgateway.oc1.iad...."
  "state" = "AVAILABLE"
  "time_created" = "2023-11-08 20:59:37.025 +0000 UTC"
  "vcn_id" = "ocid1.vcn.oc1...."
}

```
  
[< Back](../README.md)