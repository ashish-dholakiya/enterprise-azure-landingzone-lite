locals {
  location_short = "cin"

  resource_prefix = "adlz"

  common_tags = merge(
    var.tags,
    {
      deployed_by = "github-actions"
    }
  )

  resource_group_name = "rg-${local.resource_prefix}-dev-${local.location_short}-01"
}