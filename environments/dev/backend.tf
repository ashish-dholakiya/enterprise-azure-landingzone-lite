terraform {
  backend "azurerm" {
    resource_group_name  = "rg-tfstate-centralindia-01"
    storage_account_name = "sttfstateadplatform01"
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
  }
}