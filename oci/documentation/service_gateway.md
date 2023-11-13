# Configuration Based Terraform

### Service Gateway

> Current Version: 0.1.0
</br>
> Status: Test

- Configuration
  - [Example](./service_gateway.md#example)
  - [Settings](./service_gateway.md#settings)

- Modules: 
  - [Create](./service_gateway.md#create)
  - [List](./service_gateway.md#list)

- Outputs
  - [List](./service_gateway.md#list)
  - [Map](./service_gateway.md#map)
  - [Raw](./service_gateway.md#raw)

## Configuration

  ```
  {
    compartment           = "shared-network"
    enable                = false
    label                 = "sg1"
    name                  = "sg1"
    prefix                = []
    service               = {
      labels              = []
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
module "service_gateway-create"     {
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
  source                            = "./modules/service_gateway/create"
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