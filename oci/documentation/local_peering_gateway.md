# Configuration Based Terraform

### Local Peering Gateway

> Current Version: 0.1.0
</br>
> Status: Test

- Configuration
  - [Example](./local_peering_gateway.md#example)
  - [Settings](./local_peering_gateway.md#settings)

- Modules: 
  - [Create](./local_peering_gateway.md#create)
  - [List](./local_peering_gateway.md#list)

- Outputs
  - [List](./local_peering_gateway.md#list)
  - [Map](./local_peering_gateway.md#map)
  - [Raw](./local_peering_gateway.md#raw)

## Configuration

  ```
  {
    compartment           = "shared-network"
    enable                = true
    label                 = "tenancy"
    name                  = "tenancy"
    
    prefix                = []
    #route_table           = null
    tags                  = {
      defined             = {}
      freeform            = {}
    }
    suffix                = []
    vcn                   = {
      compartment         = "shared-network"
      label               = "tenancy"
      peer                = {
        compartment       = "uae-network"
        primary           = true 
        label             = "uae"
      }
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
module "local_peering_gateways-create" {
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
  source                            = "./modules/local_peering_gateways/create"
  tenancy_map                       = var.tenancy[var.local.execution_target.name]
  vcns_map                          = module.vcns-create.vcns-map
}
```

### List

```
module "local_peering_gateways-list" {
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
  source                            = "./modules/local_peering_gateways/list"
  tenancy_map                       = var.tenancy[var.local.execution_target.name]
  #vcns_map                          = module.vcns-list.vcns-map
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
  "compartment_id" = "ocid1.compartment.oc1...."
  "defined_tags" = {}
  "display_name" = "tenancy-lpg"
  "freeform_tags" = {
    "label" = "tenancy"
    "lpg_peer" = "uae-network/uae"
    "lpg_primary" = "true"
    "tf" = "true"
    "timestamp" = "2023-11-12T02:56:02Z"
  }
  "id" = "ocid1.localpeeringgateway.oc1.iad..."
  "is_cross_tenancy_peering" = false
  "peer_advertised_cidr" = "10.1.2.0/23"
  "peer_advertised_cidr_details" = [
    "10.1.2.0/23",
  ]
  "peer_id" = "ocid1.localpeeringgateway.oc1.iad...."
  "peering_status" = "PEERED"
  "peering_status_details" = "Connected to a peer."
  "state" = "AVAILABLE"
  "time_created" = "2023-11-08 20:59:37.816 +0000 UTC"
  "vcn_id" = "ocid1.vcn.oc1.iad...."
}
```
  
[< Back](../README.md)