variable "environment" {
  type        = string
  description = "The deployment environment (e.g. dev, qa, prod)."
}

variable "space_ids" {
  type        = map(string)
  description = "Map of cloud-provider keys to Spacelift space IDs. Expected keys: aws, azure."
}

variable "aws_integration_id" {
  type        = string
  description = "Spacelift AWS integration ID for this environment."
}

variable "azure_integration_id" {
  type        = string
  description = "Spacelift Azure integration ID for this environment."
  default     = ""
}

variable "security_group_policy_id" {
  type        = string
  description = "Spacelift policy ID for the security-group-port ingress policy."
  default     = ""
}
