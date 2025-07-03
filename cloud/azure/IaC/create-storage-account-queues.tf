#Create Storage Account and  Queues


terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
	 azuread = {
      source  = "hashicorp/azuread"
      version = ">= 2.30.0"
    }
	time = {
      source  = "hashicorp/time"
      version = ">= 0.7.1"
    }
  }
}

# Configure the Azure Provider
provider "azurerm" {
  features {}
}


variable "names"{
type=map
default={
"rg_name"="rg-scom-backend-003"
"location"="eastus"
"sa_name"="storagescom003"
"sp_name"="sp-demo-003"
}
}	

#Create Service Principal

data "azuread_client_config" "current" {}

data "azurerm_subscription" "primary" {}

resource "azuread_application" "sp" {
  display_name = var.names["sp_name"]
   owners           = [data.azuread_client_config.current.object_id]
}

resource "azuread_service_principal" "sp" {
  client_id = azuread_application.sp.client_id
    owners            = [data.azuread_client_config.current.object_id]
}

resource "time_rotating" "month" {
  rotation_days = 30
}

resource "azuread_service_principal_password" "sp" {
  service_principal_id ="/servicePrincipals/${azuread_service_principal.sp.object_id}"
  rotate_when_changed  = { rotation = time_rotating.month.id }
}


resource "azurerm_role_assignment" "sp" {
  scope                = data.azurerm_subscription.primary.id
  role_definition_name = "Contributor"
  principal_id         = azuread_service_principal.sp.object_id
}




resource "azurerm_storage_account" "sa" {
  name                     =  var.names["sa_name"]
  resource_group_name = var.names["rg_name"]
  location            = var.names["location"]
  account_tier             = "Standard"
  account_replication_type = "GRS" 
}

## Queues for UGC
resource "azurerm_storage_queue" "sq_ugc_s" {
  name                 = "q-ugc-store"
  storage_account_name = azurerm_storage_account.sa.name
}

data "azurerm_storage_queue" "sq_ugc_s" {
  name                 = azurerm_storage_queue.sq_ugc_s.name
  storage_account_name = azurerm_storage_account.sa.name
}
output "queue_id" {
value="azurerm_storage_queue.sq_ugc_s.id"
description="Storage queue id"
}

resource "azurerm_role_assignment" "sq_ugc_s_role" {
 scope              = azurerm_storage_queue.sq_ugc_s.id
role_definition_id = "974c5e8b-45b9-4653-ba55-5f855dd0fb88" # Storage Queue Data Contributor
principal_id       = azuread_service_principal.sp.object_id 
}
resource "azurerm_storage_queue" "sq_ugc_r" {
  name                 = "q-ugc-retrieve"
  storage_account_name = azurerm_storage_account.sa.name
}
resource "azurerm_storage_queue" "sq_ugc_n" {
  name                 = "q-ugc-notify"
  storage_account_name = azurerm_storage_account.sa.name
}
resource "azurerm_storage_queue" "sq_ugc_d" {
  name                 = "q-ugc-delete"
  storage_account_name = azurerm_storage_account.sa.name
}

## Queues for Retariler images
resource "azurerm_storage_queue" "sq_ri_s" {
  name                 = "q-ri-store"
  storage_account_name = azurerm_storage_account.sa.name
}
resource "azurerm_storage_queue" "sq_ri_r" {
  name                 = "q-ri-retrieve"
  storage_account_name = azurerm_storage_account.sa.name
}
resource "azurerm_storage_queue" "sq_ri_n" {
  name                 = "q-ri-notify"
  storage_account_name = azurerm_storage_account.sa.name
}
resource "azurerm_storage_queue" "sq_ri_d" {
  name                 = "q-ri-delete"
  storage_account_name = azurerm_storage_account.sa.name
}


#### ERROR :
#│ Error: invalid value for scope (Subscription scope is invalid)
#│
#│   with azurerm_role_assignment.sq_ugc_s_role,
#│   on main.tf line 92, in resource "azurerm_role_assignment" "sq_ugc_s_role":
#│   96:   scope              = data.azurerm_storage_queue.sq_ugc_s.id
