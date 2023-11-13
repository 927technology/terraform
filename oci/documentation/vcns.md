# Configuration Based Terraform

### VCN

> Current Version: 0.1.0
</br>
> Status: Test

- Configuration
  - [Example](./vcns.md#example)
  - [Settings](./vcns.md#settings)

- Modules: 
  - [Create](./vcns.md#create)
  - [List](./vcns.md#list)

- Outputs
  - [List](./vcns.md#list)
  - [Map](./vcns.md#map)
  - [Raw](./vcns.md#raw)

## Configuration

  ```
  {
    compartment           = "shared-network"

    byoipv6cidr_details   = {
      byoipv6range_id     = null
      ipv6cidr_block      = null
    }
    #cidr_block            = null                                                         #depricated
    cidr_blocks           = [
                              "1.2.3.4/23"
    ]
    defined_tags          = {}
    dns_label             = null
    enable                = true
    label                 = "tenancy"
    name                  = "tenancy"
    tags                  = {
      defined             = {}
      freeform            = {}
    }
    ipv6private_cidr_blocks = []
    #is_ipv6enabled        = null
    #is_oracle_gua_allocation_enabled = null
    prefix                = []
    suffix                = []
  }
  ...
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
module "vcns-create"                { # reads var.config and creates vcns
  after                             = [
                                        module.compartments-create
  ]
  compartments_map                  = module.compartments-create.map
  default_map                       = var.config.et["default"].infrastructure
  depends_on                        = [
                                        module.compartments-create
  ]
  et_map                            = var.config.et[var.local.execution_target.name].infrastructure
  source                            = "./modules/vcns/create"
}
```

### List

```
module "vcns-list"                  { # reads var.config and lists vcns
  after                             = [
                                        module.compartments-create
  ]
  compartments_map                  = module.compartments-create.map
  default_map                       = var.config.et["default"].infrastructure
  depends_on                        = [
                                        module.compartments-create
  ]
  et_map                            = var.config.et[var.local.execution_target.name].infrastructure
  source                            = "./modules/vcns/list"
}
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
"tenancy" = {
  "byoipv6cidr_blocks" = []
  "byoipv6cidr_details" = []
  "cidr_block" = "1.2.3.4/24"
  "cidr_blocks" = [
    "1.2.3.4/24",
  ]
  "compartment_id" = "ocid1.compartment.oc1....."
  "default_dhcp_options_id" = "ocid1.dhcpoptions.oc1....."
  "default_route_table_id" = "ocid1.routetable.oc1....
  "default_security_list_id" = "ocid1.securitylist.oc1....."
  "defined_tags" = {}
  "display_name" = "tenancy-vcn"
  "freeform_tags" = {
    "label" = "tenancy"
    "tf" = "true"
    "timestamp" = "2023-11-12T02:55:59Z"
  }
  "id" = "ocid1.vcn.oc1....."
  "ipv6cidr_blocks" = []
  "ipv6private_cidr_blocks" = []
  "is_ipv6enabled" = false
  "state" = "AVAILABLE"
  "time_created" = "2023-11-08 20:59:32.394 +0000 UTC"
}

```
  
  [< Back](../README.md)