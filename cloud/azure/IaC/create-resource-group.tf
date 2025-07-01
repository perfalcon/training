# Create the Resource Group 
#=======Providers===========
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>4.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
  }
}

provider "azurerm" {  
  features {}
  
}

#=======Variables==========
#create resource group

variable "resource_group_location" {
  type        = string
  default     = "eastus"
  description = "Location of the resource group."
}

variable "resource_group_name_prefix" {
  type        = string
  default     = "rg"
  description = "Prefix of the resource group name that's combined with a random ID so name is unique in your Azure subscription."
}


#======Main================

# Create a random name for the resource group using random_pet
#resource "random_pet" "rg_name" {
 # prefix = var.resource_group_name_prefix
#}
locals{
common_tags = {
    soa_application_name     = "scom-assetmamager"
    soa_application_team = "soa_application_team"
    soa_business_criticality   = "low"
	soa_cost_center = "10.605301.0000.506.00.000.000"
	soa_data_classification="internal"
	soa_environment="dev"
	soa_owner_email="bthati@abc.com"
  }
  }

# Create a resource group using the generated random name
resource "azurerm_resource_group" "example" {
  location = var.resource_group_location
  name     = "rg-s-backend-002"
  tags = local.common_tags
}

#========Outputs============
#resource group
output "resource_group_name" {
  value = azurerm_resource_group.example.name
}
