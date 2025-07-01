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



#==============MAIN - LAW & RG ======= START

locals{
common_tags = {
    application_name     = "s-assetmamager"
  	data_classification="internal"
	environment="dev"
	owner_email="bthati@abc.com"
  }
  }

# Create a resource group using the generated random name
resource "azurerm_resource_group" "rg_data" {
  name     = "rg-s-backend-003"
  location = "eastus"
  tags = local.common_tags
}

resource "azurerm_log_analytics_workspace" "law_data" {
  name                = "law-s-backend-003"
  location            = azurerm_resource_group.rg_data.location
  resource_group_name = azurerm_resource_group.rg_data.name
  sku                 = "PerGB2018"
}
#==============MAIN - LAW & RG ======= END
