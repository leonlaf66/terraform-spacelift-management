locals {
  prod_space_id                    = "aws-prod-01K5CD6C5VHW724JMJFHJXZE9K"
  prod_branch                       = "main"
  environment                      = "prod"
  github_action_deploy             = true
  prod_aws_integration_id           = "01K48A89P24CVYM1MVETR4YZ19"
  security_group_ingress_policy_id = "security-group-port-policy"
  deny_working_branches_policy_id  = "deny-working-branches"
  common_labels = {
    "env"        = local.environment
    "managed-by" = "terraform"
  }

  stacks = module.inventory.stacks
}

module "inventory" {
  source = "../Inventory"

  environment                     = local.environment
  space_ids                       = var.prod_space_id
  aws_integration_id              = local.prod_aws_integration_id
  security_group_policy_id        = local.security_group_ingress_policy_id
  deny_working_branches_policy_id = local.deny_working_branches_policy_id
}