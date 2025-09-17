# ------------------------------------------------------------------------------
# Core Stack Configuration
# ------------------------------------------------------------------------------
variable "stack_name" {
  type        = string
  description = "The name of the Spacelift stack."
}

variable "repository" {
  type        = string
  description = "The name of the Git repository for the stack (e.g., 'my-app-infra')."
}

variable "branch" {
  type        = string
  default     = "main"
  description = "The Git branch that Spacelift will track."
}

variable "description" {
  type        = string
  description = "A human-readable description of the stack's purpose."
  default     = ""
}

variable "project_root" {
  type        = string
  description = "The path within the repository where the Terraform code is located."
  default     = "."
}

variable "space_id" {
  type        = string
  description = "The ID of the Spacelift space to which the stack belongs."
}

# ------------------------------------------------------------------------------
# Behavior & Security
# ------------------------------------------------------------------------------
variable "auto_deploy" {
  type        = bool
  description = "Whether to automatically deploy changes on the tracked branch."
  default     = false
}

variable "administrative" {
  type        = bool
  description = "Set to true to make this a Spacelift administrative stack."
  default     = false
}

variable "terraform_version" {
  type        = string
  description = "The version of Terraform to use for this stack."
  default     = "1.5.7"
}

variable "enable_well_known_secret_masking" {
  type        = bool
  description = "Enables automatic masking of common secret patterns in logs."
  default     = true
}

variable "enable_sensitive_outputs_upload" {
  type        = bool
  description = "Allows the stack to upload sensitive Terraform outputs to Spacelift."
  default     = true
}

variable "github_action_deploy" {
  type        = bool
  description = "Set to true to enable deployments for this stack from GitHub Actions."
  default     = false
}

# ------------------------------------------------------------------------------
# Advanced & Organizational
# ------------------------------------------------------------------------------
variable "common_labels" {
  type        = map(string)
  description = "A map of labels to apply to the stack for organization."
  default     = {}
}

variable "git_sparse_checkout_paths" {
  type        = list(string)
  description = "A list of paths to check out from the repository, for sparse checkout."
  default     = []
}

# ------------------------------------------------------------------------------
# Dynamic Attachments
# ------------------------------------------------------------------------------
variable "policy_ids_to_attach" {
  type        = list(string)
  description = "A list of Spacelift Policy IDs to attach to this stack."
  default     = []
}

variable "context_ids_to_attach" {
  type        = list(string)
  description = "A list of Spacelift Context IDs to attach to this stack."
  default     = []
}

variable "aws_integration_ids_to_attach" {
  type        = list(string)
  description = "A list of Spacelift AWS Integration IDs to attach to this stack."
  default     = []
}

variable "aws_attachment_read" {
  type        = bool
  description = "Whether the attached AWS integrations should have read access."
  default     = true
}

variable "aws_attachment_write" {
  type        = bool
  description = "Whether the attached AWS integrations should have write access."
  default     = true
}

variable "environment" {
  type        = string
  description = "The project environment"
}