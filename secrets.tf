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

resource "azurerm_key_vault_secret" "core-storage-account-name" {
  name = "core-storage-account-name"
  value = "${azurerm_storage_account.core-storage-account.name}"
  vault_uri = "${module.vault.vault-uri}"
}