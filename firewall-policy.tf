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

resource "azurerm_firewall_policy_rule_collection_group" "rule_collection_group" {
  name               = "MyFirewallPolicyRuleCollectionGroup"
  firewall_policy_id = azurerm_firewall_policy.firewall_policy.id
  priority           = 100

  network_rule_collection {
    name     = "MyNetworkRuleCollection1"
    priority = 100
    action   = "Allow"
    rule {
      name                  = "WebRule"
      protocols             = ["TCP"]
      source_addresses      = ["10.0.0.1"]
      destination_addresses = ["192.168.1.1", "192.168.1.2"]
      destination_ports     = ["80", "443"]
    }
  }
}