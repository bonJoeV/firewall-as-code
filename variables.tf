variable "provider_subscription_id" {
  description = "Subscription ID"
  type        = string
  sensitive   = true
}

variable "backend_resource_group" {
  description = "Resource Group of the Storage Account to store state file"
  type        = string
}

variable "backend_storage_account" {
  description = "Storage Account to store state file"
  type        = string
}

variable "firewall_policy_resource_group" {
  description = "RG of the Firewall Policy"
  type        = string
}

variable "firewall_policy_name" {
  description = "Name of the Firewall Policy"
  type = string
}
