locals {
  dev_space_id                  = "aws-dev-01K5CD5P72YQ542KFHQVCZYJDW"
  dev_branch                    = "main"
  environment                   = "dev"
  github_action_deploy          = true
  aws_integration_ids_to_attach = ["01K48A89P24CVYM1MVETR4YZ19"]
  common_labels                 = {
    "env"        = "dev",
    "managed-by" = "terraform"
  }

  stacks = {
    "spacelift-demo" = {
      description                   = "Manages dev infrastructure for the spacelift demo."
      repository                    = "leonlaf66/terraform-spacelift-demo"
      project_root                  = local.environment
      github_action_deploy          = local.github_action_deploy
      aws_integration_ids_to_attach = local.aws_integration_ids_to_attach
      git_sparse_checkout_paths     = "common_modules"
      policy_ids                    = ["security-group-port-policy"]
      context_ids                   = []
    }
  }
}