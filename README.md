# core-infrastructure

the following resources must exist before invoking this template :

>#### `storage account` 
>- `name` : `lvmhtfstate` 
>- `container_name` : `tfstate` 

Before executing terraform commands the following environment variables must be set 
```bash
ARM_CLIENT_ID
ARM_CLIENT_SECRET
ARM_SUBSCRIPTION_ID
ARM_TENANT_ID
ARM_ACCESS_KEY
TF_VAR_tenant_id
TF_VAR_object_id
TF_VAR_location
TF_VAR_resource_group_name
TF_VAR_owner_object_id
```

## create the core infrastructure

The following resources will be created 

* resource group
* vault
* vnet, subnet

### init
````bash
$ terraform init
````

### plan
````bash
terraform plan
````

### create
````bash
terraform apply -auto-approve
````
