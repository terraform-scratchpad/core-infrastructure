#
# store secrets/shared into vault
#
resource "azurerm_key_vault_secret" "core-network-id" {
  name      = "core-network-id"
  value     = "${module.core-network.core-network-id}"
  vault_uri = "${module.vault.vault-uri}"
}

resource "azurerm_key_vault_secret" "core-subnet-id" {
  name      = "core-subnet-id"
  value     = "${module.core-network.core-subnet-id}"
  vault_uri = "${module.vault.vault-uri}"
}

resource "azurerm_key_vault_secret" "core-nsg-id" {
  name      = "core-nsg-id"
  value     = "${module.core-network.core-nsg-id}"
  vault_uri = "${module.vault.vault-uri}"
}
resource "azurerm_key_vault_secret" "store-vm-admin-username" {
  name        = "core-admin-vm-username"
  value       = "${module.vm.vm-admin-username}"
  vault_uri   = "${module.vault.vault-uri}"
}

resource "azurerm_key_vault_secret" "store-vm-admin-password" {
  name        = "core-admin-vm-password"
  value       = "${module.vm.vm-admin-password}"
  vault_uri   = "${module.vault.vault-uri}"
}