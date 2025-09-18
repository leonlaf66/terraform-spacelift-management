locals {
  dev_space_id                  = "aws-dev-01K5CD5P72YQ542KFHQVCZYJDW"
  dev_branch                    = "main"
  environment                   = "dev"
  github_action_deploy          = true
  dev_aws_integration_id           = "01K48A89P24CVYM1MVETR4YZ19"
  security_group_ingress_policy_id = "security-group-port-policy"
  common_labels                 = {
    "env"        = "dev",
    "managed-by" = "terraform"
  }

  stacks = {
    "spacelift-demo" = {
      description                   = "Manages dev infrastructure for the spacelift demo."
      repository                    = "spacelift-demo"
      project_root                  = local.environment
      additional_project_globs      = ["common_modules/**/*"]
      policy_ids_to_attach          = [local.security_group_ingress_policy_id] 
      aws_integration_ids_to_attach = [local.dev_aws_integration_id]
    }
  }
}