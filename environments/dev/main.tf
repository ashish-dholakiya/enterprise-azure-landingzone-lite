module "resource_group" {
  source = "../../modules/resource-group"

  resource_group_name = "rg-dev-centralindia-01"
  location            = var.location
  tags                = var.tags
}