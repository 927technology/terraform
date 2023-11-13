# Configuration Based Terraform

### Route Table

> Current Version: 0.1.0 
</br>
> Status: Test

- Configuration
  - [Example](./route_table.md#example)
  - [Settings](./route_table.md#settings)

- Module(s): 
  - [Create](./route_table.md#create)
  - [List](./route_table.md#list)

- Outputs
  - [List](./route_table.md#list)
  - [Map](./route_table.md#map)
  - [Raw](./route_table.md#raw)

## Configuration
### Example

  ```
  {
    compartment           = "shared-network"
    enable                = true
    label                 = "test"
    name                  = "test"
    prefix                = []
    route_rules           = [
      {
        description       = "test"
        destination       = {
          cidr            = {
            subnet        = "0.0.0.0"
            prefix        = "0"
          }
          type            = "CIDR_BLOCK" 
        }
        enable            = true
        network_entity    = {
          label           = "internet"
          type            = "internet_gateway" 
        }
      }
    ]
    suffix                = []
    tags                  = {
      defined             = {}
      freeform            = {}
    }
    vcn                   = {
      compartment         = "shared_network"
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
module "route_table-create"         {
  after                             = [
                                        module.compartments-create,
                                        module.compartments-list,
                                        module.internet_gateway-create,
                                        module.service_gateway-create,
                                        module.vcns-create
  ]
  compartments_map                  = module.compartments-create.map
  default_map                       = var.config.et["default"].infrastructure
  depends_on                        = [
                                        module.compartments-create,
                                        module.compartments-list,
                                        module.internet_gateway-create,
                                        module.service_gateway-create,
                                        module.vcns-create
  ]
  et_map                            = var.config.et[var.local.execution_target.name].infrastructure
  internet_gateway_map              = module.internet_gateway-create["internet_gateway-map"]
  service_gateway_map               = module.service_gateway-create["service_gateway-map"]
  source                            = "./modules/route_table/create"
  tenancy_map                       = var.tenancy[var.local.execution_target.name]
  vcns_map                          = module.vcns-create.vcns-map
}
```

### List

```
```

## Outputs
### List

```
```
### Map

```
```

### Raw

```
"test" = {
  "compartment_id" = "ocid1.compartment.oc1...."
  "defined_tags" = {}
  "display_name" = "test-rt"
  "freeform_tags" = {
    "label" = "test"
    "tf" = "true"
    "timestamp" = "2023-11-12T02:56:02Z"
  }
  "id" = "ocid1.routetable.oc1.iad...."
  "route_rules" = [
    {
      "cidr_block" = ""
      "description" = "test"
      "destination" = "0.0.0.0/0"
      "destination_type" = "CIDR_BLOCK"
      "network_entity_id" = "ocid1.internetgateway.oc1.iad...."
      "route_type" = ""
    },
  ]
  "state" = "AVAILABLE"
  "time_created" = "2023-11-09 04:15:07.362 +0000 UTC"
  "vcn_id" = "ocid1.vcn.oc1.iad...."
}
```
  
[< Back](../README.md)