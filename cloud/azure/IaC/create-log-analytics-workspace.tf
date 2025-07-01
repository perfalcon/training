#Create log analystics workspace with existing resource group
#====Providers====
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

#====Main=====
resource "azurerm_log_analytics_workspace" "example" {
  name                = "law-s-backend-002"
  resource_group_name = "rg-s-backend-002" # Replace with your existing resource group's name
  location            = "eastus" # Or your desired location
  sku                 = "PerGB2018" # Or your desired SKU (e.g., Free, Premium, etc.)
}
