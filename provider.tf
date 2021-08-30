# Configure the Azure Provider
provider "azurerm" {
  subscription_id = var.provider_subscription_id
  features {}
}

# Terraform backend config to use Storage Account. 
terraform {
  backend "azurerm" {
    resource_group_name  = var.backend_resource_group
    storage_account_name = var.backend_storage_account
    container_name       = "tfstate"
    key                  = "FirewallasCode.tfstate"
  }
}