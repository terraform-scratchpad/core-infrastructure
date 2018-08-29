variable "location" {}
variable "resource_group_name" {}
variable "tenant_id" {}
variable "object_id" {}
variable "owner_object_id" {}
variable "tags" {
  type = "map"
  default = {
    scope         = "core-qa"
    source        = "terraform"
    env           = "staging"
    costEntity    = "dior"
  }
}
variable "vm_flavor" {
  #E8s_v3
  default = "Standard_D8s_v3"
}
data "azurerm_image" "custom-image" {
  resource_group_name = "${var.resource_group_name}"
  name_regex          = "^admin-vm-\\d{4,4}-\\d{2,2}-\\d{2,2}T\\d{6,6}"
  sort_descending     = true
}