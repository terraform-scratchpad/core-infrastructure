provider "azurerm" {
  version = "1.8.0"
}

#
# creates the key vault to store secrets
#

module "vault" {
  source                = "github.com/terraform-scratchpad/azure-vault"
  location              = "${var.location}"
  resource_group_name   = "${var.resource_group_name}"
  tenant_id             = "${var.tenant_id}"
  object_id             = "${var.object_id}"
  owner_object_id       = "${var.owner_object_id}"
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
}

#
# store secrets into vault
#

resource "azurerm_key_vault_secret" "core-network-id" {
  name = "core-network-id"
  value = "${module.core-network.core-network-id}"
  vault_uri = "${module.vault.vault-uri}"
}

resource "azurerm_key_vault_secret" "core-subnet-01-id" {
  name = "core-subnet-01-id"
  value = "${module.core-network.core-subnet-id}"
  vault_uri = "${module.vault.vault-uri}"
}