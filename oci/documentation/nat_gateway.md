# Configuration Based Terraform

### NAT Gateway

> Current Version: 0.1.0
</br>
> Status: Test

- Configuration
  - [Example](./nat_gateway.md#example)
  - [Settings](./nat_gateway.md#settings)

- Modules: 
  - [Create](./nat_gateway.md#create)
  - [List](./nat_gateway.md#list)

- Outputs
  - [List](./nat_gateway.md#list)
  - [Map](./nat_gateway.md#map)
  - [Raw](./nat_gateway.md#raw)

## Configuration

  ```
  {
    active                = false
    compartment           = "shared-network"
    enable                = false
    label                 = "nat1"
    name                  = "nat1"
    prefix                = []
    public_ip             = {
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
module "nat_gateway-create"         { # reads var.config and creates nat_gateway
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
  source                            = "./modules/nat_gateway/create"
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
```
  
  [< Back](../README.md)