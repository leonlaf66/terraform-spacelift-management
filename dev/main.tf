module "spacelift_stacks" {
  source = "../modules/stacks"
  for_each                 = local.stacks
  stack_name               = "${each.key}-${local.environment}"
  repository               = each.value.repository
  branch                   = local.dev_branch
  project_root             = each.value.project_root
  description              = each.value.description
  environment              = local.environment
  additional_project_globs = each.value.additional_project_globs
  github_action_deploy     = local.github_action_deploy

  common_labels = merge(
    local.common_labels,
    { "app" = each.key }
  )

  policy_ids_to_attach            = lookup(each.value, "policy_ids_to_attach", [])
  context_ids_to_attach           = lookup(each.value, "context_ids_to_attach", [])
  aws_integration_ids_to_attach   = lookup(each.value, "aws_integration_ids_to_attach", [])
  azure_integration_ids_to_attach = lookup(each.value, "azure_integration_ids_to_attach", [])
}