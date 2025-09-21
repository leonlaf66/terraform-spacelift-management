locals {
  prod_space_id                 = "aws-prod-01K5CD6C5VHW724JMJFHJXZE9K"
  prod_branch                   = "main"
  environment                   = "prod"
  github_action_deploy          = true
  prod_aws_integration_id          = "01K48A89P24CVYM1MVETR4YZ19"
  security_group_ingress_policy_id = "security-group-port-policy"
  common_labels                 = {
    "env"        = "prod",
    "managed-by" = "terraform"
  }

  stacks = {
    "spacelift-demo" = {
      description                   = "Manages prod infrastructure for the spacelift demo."
      repository                    = "spacelift-demo"
      project_root                  = local.environment
      additional_project_globs      = ["common_modules/**/*"]
      policy_ids_to_attach          = [local.security_group_ingress_policy_id] 
      aws_integration_ids_to_attach = [local.prod_aws_integration_id]
    }
  }
}