# Configuration Based Terraform

### Network Security Group

> Current Version: 0.1.0
</br>
> Status: Test

- Configuration
  - [Example](./network_security_group.md#example)
  - [Settings](./network_security_group.md#settings)

- Modules: 
  - [Create](./network_security_group.md#create)
  - [List](./network_security_group.md#list)

- Outputs
  - [List](./network_security_group.md#list)
  - [Map](./network_security_group.md#map)
  - [Raw](./network_security_group.md#raw)

## Configuration

  ```
  {
    compartment           = "shared-network"
    enable                = true
    label                 = "test"
    name                  = "test"
    prefix                = []
    rules                 = [
      {
        description       = "Inbound SSH"
        destination       = { 
          cidr            = {
            subnet        = "0.0.0.0"
            prefix        = "0"
          }
          network_security_group = {
            label         = null
          }
          port            = {
            max           = "22"
            min           = "22"
          }
          type            = "CIDR_BLOCK" 
        }
        direction         = "INGRESS"
        enable            = true
        label             = "ssh"
        source            = {
          cidr            = {
            subnet        = "0.0.0.0"
            prefix        = "0"
          }
          network_security_group = {
            label         = null
          }
          port            = {
            max           = "22"
            min           = "22"
          }
          type            = "CIDR_BLOCK"
        }
        stateless         = false 
        protocol          = {
          icmp            = { 
            code          = null
            type          = null
          }
          type            = "tcp"
        }
      }
    ]
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
module "network_security_group-create" {
  after                             = [
                                        module.compartments-create
  ]
  compartments_map                  = module.compartments-create.map
  default_map                       = var.config.et["default"].infrastructure
  depends_on                        = [
                                        module.compartments-create
  ]
  et_map                            = var.config.et[var.local.execution_target.name].infrastructure
  source                            = "./modules/network_security_group/create"
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
"test-http" = {
  "group" = {
    "enable" = true
    "label" = "test"
  }
  "rule" = {
    "description" = "Inbound HTTP"
    "destination" = {
      "cidr" = {
        "prefix" = "0"
        "subnet" = "0.0.0.0"
      }
      "network_security_group" = {}
      "port" = {
        "max" = "80"
        "min" = "80"
      }
      "type" = "CIDR_BLOCK"
    }
    "direction" = "INGRESS"
    "enable" = true
    "label" = "http"
    "protocol" = {
      "icmp" = {}
      "type" = "tcp"
    }
    "source" = {
      "cidr" = {
        "prefix" = "0"
        "subnet" = "0.0.0.0"
      }
      "network_security_group" = {}
      "port" = {
        "max" = "80"
        "min" = "80"
      }
      "type" = "CIDR_BLOCK"
    }
    "stateless" = false
  }
}
```
  
[< Back](../README.md)