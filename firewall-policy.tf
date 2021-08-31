resource "azurerm_resource_group" "resource_group" {
  name     = var.firewall_policy_resource_group
  location = "West Europe"
}

resource "azurerm_firewall_policy" "firewall_policy" {
  name                = var.firewall_policy_name
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = azurerm_resource_group.resource_group.location
  sku                 = "Standard"
  dns {
    proxy_enabled = true
    servers       = ["1.1.1.1"]
  }
  threat_intelligence_mode = "Alert"
}
