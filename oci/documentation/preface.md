# Configuration Based Terraform

To aid in the deployment of Terraform based deployments, this project is aimed at utilizing a singular configuration file to build multiple enviromnents or Execution Targets (ET).  An ET consists of a subset of resources that are logically partitioned within a tenancy.  This ET may consist of a shared infrastructure only, which offers resources to another ET within the same tenancy which provides a webserver or database.  Each ET must NOT share any resources including Compartments, they must be logically seperated in all aspects EXCEPT that they co-exist within the same tenancy.  

This utility also supports very complicated ET definations where shared and application resources can co-exist in a singular ET defination.

OR 

Multiple instances may be used to manage different ETs.


## Naming Conventions

All resource types are seperated into files of just their type.  Data, Modules, Outputs, Resources, and Variables.  This modular approach allows for a resouce type to be removed for testing easily.  Files are named using the first letter of their resource type followed by a period "." and the full resource name as used in the Terraform registry, then the file extension .tf  

By using the name as defined in the registry, it reduces complexity of knowing when a resource is shortened or acronized.

```
The resource oci_core_local_peering_gateway would become:

r.local_peering_gateway.tf

NOT

r.lpg.tf
```

## Labels

Every resouce is defined a label.   A label is a unique reference string per resource type to identify the resource.  It is possible to have a Compartment named "Shared" and a VCN named "Shared".  When the label is referenced it is queried by its resource type then its label.

## Enable

Each individual resource, output, ET module, and Default(Global) module has an enable option.  This option is used to toggle the individual resource, output, module within an ET, or module globally within the configuration to a state of use.  A enable = false resource will be skipped by the module, allowing for the configuration to remain without other methods of removal such as deletion or commenting out. 

Use of the enable option is HIGHLY recommended because its value is used by dependant modules.

Example:

  >  All resource types are dependant on Compartments.  If a compartment is removed by deletion or commenting out, a dependant VCN would fail to find the compartment and an error would be generated during the apply due to the missing compartment.  By setting the Compartment's enable = false, allows the VCN module to check its status and then remove the VCN from the plan and not generating the error.  



Enable is a boolean value of either true or false, not a string value of "true" or "false".


```
  variable "config"                   {                           <-  root of primary config file
    type                              = map                       <-  type of variable "map"
    default                           = {                         <-  required syntax
      et                              = {                         <-  start of the ET configuration, 
                                                                      there may be multiple ETs
        cmurray                       = {                         <-  first ET defination
                                                                      layout is in Shepherd structure
          application                 = {}                        <-  application based configuration - WIP
          infrastructure              = {                         <-  infrastructure based configuration - WIP
            compartments              = [                         <-  resource type "compartments"
              { #/shared                                              resources are objects contained in
                depth                 = 1                             a list.  this is necessary due to 
                description           = "/shared"                     how terrafrom interperts the data
                                                                      structure.
                enable                = true                      <-  Enable
                
                enable_delete         = true
                label                 = "shared"                  <-  resource label
                name                  = "shared-name"             <-  resource name which can be different
                                                                      from its label
                parent                = "root"
                prefix                = []
                suffix                = []
              },
              ...
```

## Outputs

Each module has a predefined set of outputs.  These may be toggled on and off to display during an apply.

Enable is a boolean value of either true or false, not a string value of "true" or "false".

```
  compartments              = {
    outputs                 = {
      list                  = {
        enable              = false
      }
      map                   = {
        enable              = true
      }
      raw                   = {
        enable              = false
      }
    }
```

* Types
  
  * Map
    
    Output is formatted in map style with a Label => Setting layout.

    ```
    {
      label1    = {
        value1  = 1
        value2  = 2
      }
      label2    = {
        value1  = 3
        value2  = 4
      }
    }
    ```

  * List

    Output is formatted in a list style of comma seperated objects

    ```
    [
      {
        label   = "label1"
        value1  = 1
        value2  = 2
      },
      {
        label   = "label2"
        value1  = 3
        value2  = 4
      }
    ]
    ```

  * Raw 

    Output is not altered from the output from the resource.  Typical Raw format is a Map


## Versioning

Each module is assigned a version number.  This version number is used within the module to allow for multiple module versions to co-exist as they mature.  An ET that was created with a particular version of a module will not be impacted when a newer version is created.  The module checks the version string and skips it when its version string does not match.

The version string is tracked from Terraform and when the resource identifier changes from "v0_1_1" to "v0_1_2" the resource will be DESTROYED and RECREATED using the new resource label.


```
  compartments              = {
    outputs                 = {
      list                  = {
        enable              = false
      }
      map                   = {
        enable              = true
      }
      raw                   = {
        enable              = false
      }
      test                  = {
        enable              = false
      }
    }
    prefix                  = []
    suffix                  = []
    version                 = "0.1.1"
  }
  ...
```

Logic Header from Compartments Module
   
  ```
  resource "oci_identity_compartment" "v0_1_1-d1" {
    ##v0.1.1
    for_each                        = { 
      for setting in var.et_map.compartments :
        setting.label => setting

      if  ( 
          var.default_map.modules.compartments.enable         == true             &&                  #is the default module enabled
          var.et_map.modules.compartments.enable              == true             &&
          setting.enable                                      == true             &&                  #is the et module enabled
          setting.depth                                       == 1                &&
          ((var.default_map.modules.compartments.version      == "0.1.1"          &&                  #is the et module version 0.1.1 OR
            var.default_map.modules.compartments.version      == null     )       ||
            (var.et_map.modules.compartments.version          == "0.1.1"  )
          )
        )
    }
    ...
  ```


### Order of Operation
  - Compartments
    - VCN
      - Subnets
      - External Interfaces
        - Internet Gateway
        - NAT
        - Service Gateway
      - Routing
        - Routers
          - Local Peering Gateway
          - Dynamic Routing Gateway
        - Route Table
          - Route Rules
      - Network Security Group
        - Network Security Rule
 
