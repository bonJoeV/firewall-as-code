# Configure the Azure Provider
provider "azurerm" {
  subscription_id = var.provider_subscription_id
  features {}
}

# Terraform backend config to use Storage Account. 
terraform {
  backend "azurerm" {
    resource_group_name  = "rg-terraform-neu-001"
    storage_account_name = "saterraform001"
    container_name       = "tfstate"
    key                  = "FirewallasCode.tfstate"
  }
}