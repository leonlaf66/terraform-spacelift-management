locals {
  dev_branch                       = "main"
  environment                      = "dev"
  github_action_deploy             = true
  dev_aws_integration_id           = "01K48A89P24CVYM1MVETR4YZ19"
  dev_azure_integration_id         = "01KH70KYQZ69XG8H7VN964277W"
  security_group_ingress_policy_id = "security-group-port-policy"
  deny_working_branches_policy_id  = "deny-working-branches-policy"
  common_labels = {
    "env"        = local.environment
    "managed-by" = "terraform"
  }

  stacks = module.inventory.stacks
}

module "inventory" {
  source = "../Inventory"

  environment                     = local.environment
  space_ids                       = var.dev_space_id
  aws_integration_id              = local.dev_aws_integration_id
  azure_integration_id            = local.dev_azure_integration_id
  security_group_policy_id        = local.security_group_ingress_policy_id
  deny_working_branches_policy_id = local.deny_working_branches_policy_id
}