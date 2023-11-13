# Configuration Based Terraform

### Groups

> Current Version: 0.1.0
</br>
> Status: Dev

- Configuration
  - [Example](./groups.md#example)
  - [Settings](./groups.md#settings)

- Modules: 
  - [Create](./groups.md#create)
  - [List](./groups.md#list)

- Outputs
  - [List](./groups.md#list)
  - [Map](./groups.md#map)
  - [Raw](./groups.md#raw)

## Configuration

  ```
  {
    compartment           = "root"
    description           = "first test group"
    enable                = true
    members               = {
      groups              = []
      users               = [
                              "test1",
                              "test2"
      ]
    }
    tags                  = {
      defined             = {}
      freeform            = {
                              "label": "1st.test_group"

      }
    }
  }
  ```


## Settings

  compartment
  
  > The label of the compartment in which the group will be stored. 

  - Data Type : String
  - Default   : None
  - Required  : Yes

  ---

  description
  
  > A brief summary of this group to be displayed in OCI. 

  - Data Type : String
  - Default   : None
  - Required  : No

  ---

  enable
  
  > Toggles the group's status.  A group with an eanble = false will not be created.

  - Data Type : Boolean
  - Default   : None
  - Required  : Yes

  ---

  members.groups
  
  > A list of other groups that are a member of this group. 

  - Data Type : String
  - Default   : None
  - Required  : No

  ---

  members.users
  
  > A list of other users that are a member of this group. 

  - Data Type : String
  - Default   : None
  - Required  : No

  ---

  tags.defined
  
  > An object of tags that are added to the defined tags in OCI.  (Not working) 

  - Data Type : String
  - Default   : None
  - Required  : No

    ---

  tags.freeform
  
  > An object of tags that are added to the freeform tags in OCI.  (Not working) 

  - Data Type : String
  - Default   : None
  - Required  : No


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
```

## raw

```
```
  
  [< Back](../README.md)