provider "azurerm" {
  version = "1.38.0"
}

#create resource group
resource "azurerm_resource_group" "rg" {
    name     = "rg-testcondition" //use case for this function lower("TFStoragesta")
    location = var.location != "" ? var.location : "southcentralus"
}