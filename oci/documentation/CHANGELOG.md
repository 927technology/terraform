## Change Log:

### LPG

* 20231102

    Creating LPGs dynamically depends on a lookup for the OCID of the VCN.  The lookup causes the LPG to enter a state where it must be replaced.  To overcome this an new entry was added to the config to enter the OCID (et/infrastructure/local_peering_gateway/vcn/id).  When this value is set to "null" the local_peering_gateway module will lookup the OCID of the VCN to allow "from scratch" builds and builds where recreateion of the LPG will be tolerated.  Placing the OCID of the VCN as the value will cause the module to use that value and NOT perform the lookup and eliminating the rebuild.

* 20231103

    Adding the OCID to the LPG stanza in the config leads to multiple entries if this value is needed in other circumstances.  I moved the OCID to the VCN stanza, since it represents the VCN anyhow (et/infrastructure/vcn/id).  I reworked the logic to look in var.et_map.vcn to check the availability of the value.

* 20231104

    Removing the override fot the ID on the VCN.  The LPG needs to be created to allow for the peering to be established.  Removing the peering without the destruction of the LPG will result in a failed peering due the the "revoked" status of the peering.  Destruction removes the "revoked" status and allows for the reuse of the LPG description and label.

* 20231105

    Currently abandoning efforts to stop destroy/redeploy of LPGs and peerings.  Moving forward with destroy being the expected behavior.

* 20231108

    Initial efforts were using data sources within the module to generate outputs.  This causes a unknown state in the TF planning which results in resources dependant on those outputs to be destroyed/redeployed.  Module outputs have been changed to use the raw output of the resource in the module which cause the destroy/redeploy issue to be resolved.  

    All modules (compartments, vcns, subnets, & internet_gateway) are currently stable and surviving apply through multiple attempts without any resources being destroyed.

### Formatting:

* 20231108

    All files are being migrated to format of type.resource.tf  Due to some resources having to co-locate within a module, the old type.tf naming convention is no longer viable.  All types are reduced to just the first letter followed by a period "." then the resource type name as defined in the TF literature.  No resources names will be acronized or truncated to reduce confusion.

    r = resouce

    o = output
    
    etc

    e.g.  oci_core_local_peering_gateway resource would be:
    
    r.local_peering_gateway.tf

### Nat Gateway

* 20231108

    Nat gateway fails err 400 limitexceeded.  most likely due to my free account status.  TBD at a later time.

### Service Gateway
 
* 20231108

    Service Gateway not ready for testing.  No suitable service has been presented to test with.

### Internet Gateway

* 20231109

    Added  internet_gateway.  UNTESTED


### Route_table & route_rules

* 20231109

    Added route_table & route_rules.  UNTESTED
    
### Network_security_group & network_security_rule

* 20231109    

    network_security_group and network_security_group.  UNTESTED