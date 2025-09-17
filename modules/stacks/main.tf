resource "spacelift_stack" "app" {
  name         = var.stack_name
  description  = var.description != "" ? var.description : "The ${var.environment} environment for the ${var.stack_name} application."
  repository   = var.repository
  branch       = var.branch
  project_root = var.project_root

  autodeploy                       = var.auto_deploy
  administrative                   = var.administrative
  terraform_version                = var.terraform_version
  enable_sensitive_outputs_upload  = var.enable_sensitive_outputs_upload
  enable_well_known_secret_masking = var.enable_well_known_secret_masking
  git_sparse_checkout_paths        = var.git_sparse_checkout_paths
  space_id                         = var.space_id
  github_action_deploy             = var.github_action_deploy
  labels = toset(
    [for k, v in var.common_labels : "${k}:${v}"]
  )
}