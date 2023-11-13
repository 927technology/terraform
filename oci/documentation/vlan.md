# Configuration Based Terraform

### VLAN

> Current Version: 0.1.0
</br>
> Status: Dev

- Configuration
  - [Example](./vlan.md#example)
  - [Settings](./vlan.md#settings)

- Modules: 
  - [Create](./vlan.md#create)
  - [List](./vlan.md#list)

- Outputs
  - [List](./vlan.md#list)
  - [Map](./vlan.md#map)
  - [Raw](./vlan.md#raw)

## Configuration

  ```
  {
    availability_domain   = null
    cidr_block            = "1.2.3.4/24"
    compartment           = "tenancy"
    display_name          = null
    enable                = false
    nsgs                  = []
    prefix                = []
    route_table           = null
    suffix                = []
    tags                  = {
      defined             = {}
      freeform            = {
                            "label": "vlan10"
    }
    vcn                   = "test"
    vlan_tag              = 10
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