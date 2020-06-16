terraform {
    required_version = ">=0.12.0"
    
}

provider "azurerm" {
    version = ">= 2.0.0"
      features {}
subscription_id = "432358e4-068f-47b1-850a-9a94ab04ad9a"
client_id = "388a4960-7f51-438a-a9e9-fbdc248b9a94"
client_secret = "dNRG_jGwZNq7jodkgb07~0VMM2zaJ3HVlZ"
tenant_id = "bf2bef2a-5089-45d0-946e-c402a363971f"

}

variable "location" {
type = string
default = "eastus"
description = "Specify a location see az account list-locations -o table"

}

resource "azurerm_resource_group" "mytfprojectrg" {
   name = "mytfprojectrg"
   location = var.location
   tags      = {
       Environment = "DEV"
       Provisionedby = "Terraform"
       Managedby = "jamel.achahbar@dxc.com"
       CostCenter = "Azure Team"

      
    }
}

resource "azurerm_storage_account" "mytfprojectsa" {
   name = "mytfprojectsa"
   resource_group_name = azurerm_resource_group.mytfprojectrg.name
   location = azurerm_resource_group.mytfprojectrg.location
   account_tier = "Standard"
   account_replication_type = "GRS"
}

output "storage_primary_access_key" {
    value = azurerm_storage_account.mytfprojectsa.primary_access_key
}  
output "storage_primary_connection_string" {
    value = azurerm_storage_account.mytfprojectsa.primary_connection_string
}  
output "storage_primary_blob_connection_string" {
    value = azurerm_storage_account.mytfprojectsa.primary_blob_connection_string
}  
