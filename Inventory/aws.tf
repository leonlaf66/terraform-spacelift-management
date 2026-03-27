locals {
  aws_stacks = {
    "spacelift-demo" = {
      description                   = "Manages ${var.environment} infrastructure for the spacelift demo."
      repository                    = "spacelift-demo"
      space_id                      = var.space_ids["aws"]
      project_root                  = var.environment
      policy_ids_to_attach          = compact([var.security_group_policy_id])
      aws_integration_ids_to_attach = [var.aws_integration_id]
    }
    "codebuild-infra" = {
      description                   = "Manages ${var.environment} infrastructure for codebuild repo."
      repository                    = "terraform-codebuild-infra"
      space_id                      = var.space_ids["aws"]
      project_root                  = var.environment
      aws_integration_ids_to_attach = [var.aws_integration_id]
    }

    "nodejs-codebuild" = {
      description                   = "Manages ${var.environment} infrastructure for nodejs codebuild project."
      repository                    = "terraform-codebuild-demo"
      space_id                      = var.space_ids["aws"]
      project_root                  = var.environment
      aws_integration_ids_to_attach = [var.aws_integration_id]
    }

    "ec-demo" = {
      description                   = "Manages ${var.environment} infrastructure for ecs demo."
      repository                    = "terraform-ecs-demo"
      space_id                      = var.space_ids["aws"]
      project_root                  = var.environment
      additional_project_globs      = ["Inventory/*"]
      aws_integration_ids_to_attach = [var.aws_integration_id]
      policy_ids_to_attach          = compact([var.deny_working_branches_policy_id])
    }
  }
}
