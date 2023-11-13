# Configuration Based Terraform

### Users

> Current Version: 0.1.0
</br>
> Status: Dev

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

## Configuration

  ```
  {
    compartment           = "root"
    description           = "first test user"
    enable                = true
    groups                = [
      "group1",
      "group_all"
    ]
    tags                  = {
      defined             = {}
      freeform            = {
                              "label": "test1"
    }
    }
    user                  = {
      email               = "test1@no.com"
      name                = "test1"
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
```
  
[< Back](../README.md)