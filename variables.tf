variable "location" {}
variable "resource_group_name" {}
variable "tenant_id" {}
variable "object_id" {}
variable "owner_object_id" {}
variable "tags" {
  type = "map"
  default = {
    scope         = "qa"
    source        = "terraform"
    env           = "staging"
    costEntity    = "dior"
  }
}