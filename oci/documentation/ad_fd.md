# Configuration Based Terraform

### Availability/Fault Domains

> Current Version: 0.1.0
</br>
> Status: Test

- Configuration
  - [Example](./availabilitydomains.md#example)
  - [Settings](./availabilitydomains.md#settings)

- Modules: 
  - [Create](./availabilitydomains.md#create)
  - [List](./availabilitydomains.md#list)

- Outputs
  - [List](./availabilitydomains.md#list)
  - [Map](./availabilitydomains.md#map)
  - [Raw](./availabilitydomains.md#raw)

## Configuration
### Example

  ```
  None
  ```

### Settings

 > None

## Modules
### Create

```
None
```

### List

```
module "availabilitydomains" {
  tenancy_map                     = var.tenancy[var.local.execution_target.name]
  source                          = "./modules/availabilitydomains/list"
}
```

```
module "faultdomains" {
  availabilitydomains             = [
                                      module.availabilitydomains.list[0].fullname,
                                      module.availabilitydomains.list[1].fullname,
                                      module.availabilitydomains.list[2].fullname
                                    ]
  tenancy_map                     = var.tenancy[var.local.execution_target.name]
  source                          = "./modules/faultdomains/list"
}
```

## Outputs
### ad_fd-map

```
[
  [
    {
      "availability_domain" = "sVkW:US-ASHBURN-AD-1"
      "compartment_id" = "ocid1.tenancy.oc1...."
      "id" = "ocid1.faultdomain.oc1...."
      "name" = "FAULT-DOMAIN-1"
    },
    {
      "availability_domain" = "sVkW:US-ASHBURN-AD-1"
      "compartment_id" = "ocid1.tenancy.oc1...."
      "id" = "ocid1.faultdomain.oc1...."
      "name" = "FAULT-DOMAIN-2"
    }
  ],
]
```

### ad_fd-list

```
[
  {
    "availability_domain" = "sVkW:US-ASHBURN-AD-1"
    "compartment_id" = "ocid1.tenancy.oc1....
    "id" = "ocid1.faultdomain.oc1...."
    "name" = "FAULT-DOMAIN-1"
  },
  {
    "availability_domain" = "sVkW:US-ASHBURN-AD-1"
    "compartment_id" = "ocid1.tenancy.oc1...."
    "id" = "ocid1.faultdomain.oc1...."
    "name" = "FAULT-DOMAIN-2"
  }
]
```
  
[< Back](../README.md)