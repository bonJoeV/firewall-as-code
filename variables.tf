variable "provider_subscription_id" {
  description = "Subscription ID"
  type        = string
  sensitive   = true
}

variable "firewall_policy_resource_group" {
  description = "RG of the Firewall Policy"
  type        = string
}

variable "firewall_policy_name" {
  description = "Name of the Firewall Policy"
  type = string
}
