# Configuration Based Terraform

### Dynamic Routing Gateway

> Current Version: 0.1.0
</br>
> Status: Not Started

- Configuration
  - [Example](./drg.md#example)
  - [Settings](./drg.md#settings)

- Modules: 
  - [Create](./drg.md#create)
  - [List](./drg.md#list)

- Outputs
  - [List](./drg.md#list)
  - [Map](./drg.md#map)
  - [Raw](./drg.md#raw)

## Configuration

  ```
  ```


## Settings
---
  argument
  
  > description 

  - Data Type : Integer
  - Default   : None
  - Required  : Yes



## Modules

## Create

```
```

## List

```
```

## Outputs

## list

```
```
## map

```
"core" = {
    "compartment_id" = "ocid1.compartment.oc1...."
    "default_drg_route_tables" = [
      {
        "ipsec_tunnel" = "ocid1.drgroutetable.oc1...."
        "remote_peering_connection" = "ocid1.drgroutetable.oc1...."
        "vcn" = "ocid1.drgroutetable.oc1...."
        "virtual_circuit" = "ocid1.drgroutetable.oc1...."
      },
    ]
    "default_export_drg_route_distribution_id" = "ocid1.drgroutedistribution.oc1...."
    "defined_tags" = {
      "Oracle-Tags.CreatedBy" = "default/cmurray@927.technology"
      "Oracle-Tags.CreatedOn" = "2023-11-13T18:42:32.926Z"
    }
    "display_name" = "core-drg"
    "freeform_tags" = {
      "label" = "core"
      "tf" = "true"
      "timestamp" = "2023-11-13T18:42:32Z"
    }
    "id" = "ocid1.drg.oc1...."
    "redundancy_status" = "NOT_AVAILABLE"
    "state" = "AVAILABLE"
    "time_created" = "2023-11-13 18:42:32.967 +0000 UTC"
  }

```

## raw

```
```
  
  [< Back](../README.md)