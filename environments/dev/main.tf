module "resource_group" {
  source = "../../modules/resource-group"

  resource_group_name = local.resource_group_name
  location            = var.location
  tags                = local.common_tags
}

module "vnet" {
  source = "../../modules/vnet"

  name                = "vnet-${local.resource_prefix}-dev-${local.location_short}-01"
  resource_group_name = local.resource_group_name
  location            = var.location
  address_space       = ["10.10.0.0/16"]
  tags                = local.common_tags
}