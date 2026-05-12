locals {
  location_short = "cin"

  resource_prefix = "adlz"

  common_tags = {
    environment = "dev"
    project     = "enterprise-azure-landingzone-lite"
    managed_by  = "terraform"
    owner       = "ashish-dholakiya"
    cost_center = "personal-lab"
    deployed_by = "github-actions"
  }

  resource_group_name = "rg-${local.resource_prefix}-dev-${local.location_short}-01"
}