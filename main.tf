# ---------------------------------------------------------
# Template creates core infrastrucutre hosting qa envs
# ---------------------------------------------------------

#
# using azure storage as backend
#
terraform {
  backend "azurerm" {
    storage_account_name  = "qatfstate"
    container_name        = "qatfstatecnt"
    key                   = "qa-core-infrastructure.tfstate"
  }
}

#
# ARM provider
#
provider "azurerm" {
  version = "~> 1.12.0"
}

provider "null" {}

#
# creates the key vault to store secrets
#
module "vault" {
  core-vault-name       = "core-vault"
  source                = "github.com/terraform-scratchpad/azure-vault"
  location              = "${var.location}"
  resource_group_name   = "${var.resource_group_name}"
  tenant_id             = "${var.tenant_id}"
  object_id             = "${var.object_id}"
  owner_object_id       = "${var.owner_object_id}"
  tags                  = "${var.tags}"
}

#
# create main VMs network
#
module "core-network" {
  source                = "github.com/terraform-scratchpad/azure-simple-vnet"
  location              = "${var.location}"
  resource_group_name   = "${var.resource_group_name}"
  network_address_space = "172.168.0.0/16"
  subnet_address_prefix = "172.168.1.0/24"
  tags                  = "${var.tags}"
}

#
# creation of the admin VM (all commands should be run from this admin machine)
#
module "vm" {
  source                        = "github.com/terraform-scratchpad/azure-custom-image-compute"
  vm_name_is_random             = "0"
  vm_name                       = "adminVM"
  location                      = "${var.location}"
  resource_group_name           = "${var.resource_group_name}"
  vm_flavor                     = "${var.vm_flavor}"
  custom-image-id               = "${data.azurerm_image.custom-image.id}"
  custom-image-resource-group   = "${var.resource_group_name}"
  subnet_id                     = "${module.core-network.core-subnet-id}"
  nsg_id                        = "${module.core-network.core-nsg-id}"
  tags                          = {
    scope         = "core-qa"
    source        = "terraform"
    costEntity    = "dior"
    description   = "admin VM"
  }
}
