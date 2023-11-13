# Configuration Based Terraform

### Services

> Current Version: 0.1.0
</br>
> Status: Test

- Configuration
  - [Example](./services.md#example)
  - [Settings](./services.md#settings)

- Modules: 
  - [Create](./services.md#create)
  - [List](./services.md#list)

- Outputs
  - [List](./services.md#list)
  - [Map](./services.md#map)
  - [Raw](./services.md#raw)

## Configuration

  ```
  None
  ```


## Settings

  None



## Modules

### Create

```
None
```

### List

```
module "services-list"              { 
  depends_on                        = []
  source                            = "./modules/services/list"
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
{
  "id" = "CoreServicesDataSource-0"
  "services" = [
    {
    "cidr_block" = "oci-iad-objectstorage"
    "description" = "OCI IAD Object Storage"
    "id" = "ocid1.service.oc1...
    "name" = "OCI IAD Object Storage"
    },
    {
    "cidr_block" = "all-iad-services-in-oracle-services-network"
    "description" = "All IAD Services In Oracle Services Network"
    "id" = "ocid1.service.oc1...."
    "name" = "All IAD Services In Oracle Services Network"
    },
  ]
}
```
  
  [< Back](../README.md)