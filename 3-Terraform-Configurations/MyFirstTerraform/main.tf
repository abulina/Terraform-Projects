#Get subscription
data "azurerm_subscription" "current" {
}
output "current_subscription_display_name" {
  value = data.azurerm_subscription.current.display_name
  }

#create resource group
resource "azurerm_resource_group" "rg" {
    name     = "rg-MyFirstTerraform"
    location = "westus2"
    tags      = {
      Environment = "Terraform Demo"
      
    }
}
