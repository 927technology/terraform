# Configuration Based Terraform

### Compartments

> Current Version: 0.1.1
</br>
> Status: Test

- Configuration
  - [Example](./compartments.md#example)
  - [Settings](./compartments.md#settings)

- Modules: 
  - [Create](./compartments.md#create)
  - [List](./compartments.md#list)

- Outputs
  - [List](./compartments.md#list)
  - [Map](./compartments.md#map)
  - [Raw](./compartments.md#raw)

## Configuration
### Example

  ```
  compartments              = [
    {
      depth                 = 1
      description           = "/shared"
      enable                = true
      enable_delete         = true
      label                 = "shared"
      name                  = "shared"
      parent                = "root"
      prefix                = []
      suffix                = []
    }
  }
  ```


## Settings

  depth
  
  > Due to the way OCI stores compartments, parent/child relationships are determined by their depth.  A depth of 0 is the "root" of the tenancy, and child compartments are created recursively based on their depth. </p> This order ensures that compartments of lesser depths are created before their dependant compartments are.  Up to depth 5 is supported. </p>  e.g. </br> A Compartment with a depth of 3 is created before one with a depth of 5. 

  - Data Type : Integer
  - Default   : None
  - Required  : Yes

---
  description

  > A description of the compartments.
  
  - Data Type : String
  - Default   : None
  - Required  : No

---
  enable
  
  > Toggles the compartments status.  A compartment with an eanble = false will not be created.

  - Data Type : Boolean
  - Default   : None
  - Required  : Yes

  ---
  enable_delete
  
  > Toggles the ability for a compartment to be deleted by Terraform.  A compartment with an eanble_delete = false will not be able to be deleted by Terraform and will throw an error if attempted.

  - Data Type : Boolean
  - Default   : None
  - Required  : Yes

  ---
  label
  
  > The name by which this resource is referred to when queried by the code.

  - Data Type : String
  - Default   : None
  - Required  : Yes

  ---
  name
  
  > The base name by which this resource is referred to when displayed in OCI.

  - Data Type : String
  - Default   : None
  - Required  : Yes

  ---
  parent
  
  > The label of the compartment which acts as a parent to this one.  "root" is used for the root compartment, and the compartment's label is used for any other compartment.

  - Data Type : String
  - Default   : None
  - Required  : Yes

  ---
  prefix
  
  > An additional [ 0 - 2 ] prefixes to be added to the name displayed in the OCI console. </p> Any prefixes beyond 2 will be igonred. </p> e.g. </br>name = test</br> prefix = [ "prs" ] </p> Would Generate a Display Name in OCI of </br>
  prs-test

  - Data Type : String
  - Default   : None
  - Required  : no

  ---
  suffix
  
  > An additional [ 0 - 1 ] suffixes to be added to the name displayed in the OCI console.  </p> e.g. </br>name = test</br> suffix = [ "cmp" ] </p> Would Generate a Display Name in OCI of </br>
  test-cmp

  - Data Type : String
  - Default   : None
  - Required  : no



## Modules
### Create

```
module "compartments-create" {
  default_map                       = var.config.et["default"].infrastructure
  et_map                            = var.config.et[var.local.execution_target.name].infrastructure
  source                            = "./modules/compartments/create"
  tenancy_map                       = var.tenancy[var.local.execution_target.name]
}
```

### List

```
module "compartments-list" {
  default_map                       = var.config.et["default"].infrastructure
  et_map                            = var.config.et[var.local.execution_target.name].infrastructure
  source                            = "./modules/compartments/list"
  tenancy_map                       = var.tenancy[var.local.execution_target.name]
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
"shared" = {
  "compartment_id" = "ocid1.tenancy.oc1...."
  "defined_tags" = {
    "Oracle-Tags.CreatedBy" = "default/cmurray@927.technology"
    "Oracle-Tags.CreatedOn" = "2023-11-08T20:59:11.299Z"
  }
  "description" = "/shared"
  "enable_delete" = false
  "freeform_tags" = {
    "depth" = "1"
    "label" = "shared"
    "tf" = "true"
    "timestamp" = "2023-11-12T02:55:53Z"
  }
  "id" = "ocid1.compartment.oc1....."
  "inactive_state" = ""
  "is_accessible" = false
  "name" = "shared"
  "state" = "ACTIVE"
  "time_created" = "2023-11-08 20:59:11.574 +0000 UTC"
}
...
```
  
[< Back](../README.md)