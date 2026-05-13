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

module "subnet_app" {
  source = "../../modules/subnet"

  name                 = "snet-${local.resource_prefix}-dev-app-${local.location_short}-01"
  resource_group_name  = local.resource_group_name
  virtual_network_name = "vnet-${local.resource_prefix}-dev-${local.location_short}-01"
  address_prefixes     = ["10.10.1.0/24"]
}

module "subnet_mgmt" {
  source = "../../modules/subnet"

  name                 = "snet-${local.resource_prefix}-dev-mgmt-${local.location_short}-01"
  resource_group_name  = local.resource_group_name
  virtual_network_name = "vnet-${local.resource_prefix}-dev-${local.location_short}-01"
  address_prefixes     = ["10.10.2.0/24"]
}

module "nsg_app" {
  source = "../../modules/nsg"

  name                = "nsg-${local.resource_prefix}-dev-app-${local.location_short}-01"
  location            = var.location
  resource_group_name = local.resource_group_name
  tags                = local.common_tags
}

module "nsg_mgmt" {
  source = "../../modules/nsg"

  name                = "nsg-${local.resource_prefix}-dev-mgmt-${local.location_short}-01"
  location            = var.location
  resource_group_name = local.resource_group_name
  tags                = local.common_tags
}

module "nsg_assoc_app" {
  source = "../../modules/nsg-association"

  subnet_id                 = module.subnet_app.id
  network_security_group_id = module.nsg_app.id
}

module "nsg_assoc_mgmt" {
  source = "../../modules/nsg-association"

  subnet_id                 = module.subnet_mgmt.id
  network_security_group_id = module.nsg_mgmt.id
}