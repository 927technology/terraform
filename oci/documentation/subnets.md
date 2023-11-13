# Configuration Based Terraform

### Subnets

> Current Version: 0.1.0
</br>
> Status: Test

- Configuration
  - [Example](./subnets.md#example)
  - [Settings](./subnets.md#settings)

- Modules: 
  - [Create](./subnets.md#create)
  - [List](./subnets.md#list)

- Outputs
  - [List](./subnets.md#list)
  - [Map](./subnets.md#map)
  - [Raw](./subnets.md#raw)

### Configuration

  ```
  {
    cidr                  = {
      subnet              = "10.1.0.0"
      prefix              = "30"
    }
    compartment           = "shared-network"
    #dns_label             = null
    enable                = true
    #ipv6cidr_block        = null
    #ipv6cidr_blocks       = null
    label                 = "shared-jump"
    name                  = "shared-jump"
    #prohibit              = {
    #  internet_ingress    = null
    #  public_ip_on_vnic   = null
    #}
    #route_table           = null
    #security_lists        = []
    prefix                = []
    tags                  = {
      defined             = {}
      freeform            = {}
    }
    suffix                = []
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
"apex" = {
  "cidr_block" = "1.2.3.4/24"
  "compartment_id" = "ocid1.compartment.oc1...."
  "defined_tags" = {}
  "dhcp_options_id" = "ocid1.dhcpoptions.oc1...."
  "display_name" = "apex-sn"
  "freeform_tags" = {
    "label" = "apex"
    "tf" = "true"
    "timestamp" = "2023-11-12T02:56:00Z"
  }
  "id" = "ocid1.subnet.oc1...."
  "ipv6cidr_blocks" = []
  "prohibit_internet_ingress" = false
  "prohibit_public_ip_on_vnic" = false
  "route_table_id" = "ocid1.routetable.oc1...."
  "security_list_ids" = [
    "ocid1.securitylist.oc1....",
  ]
  "state" = "UPDATING"
  "time_created" = "2023-11-08 20:59:33.806 +0000 UTC"
  "vcn_id" = "ocid1.vcn.oc1...."
  "virtual_router_ip" = "1.2.3.1"
  "virtual_router_mac" = "00:00:17:DE:03:65"
}
```
  
[< Back](../README.md)