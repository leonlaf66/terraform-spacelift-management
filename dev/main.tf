#module "spacelift_stacks" {
#  source = "../modules/stacks"

###
 # repository               = each.value.repository
 # branch                   = local.dev_branch
 # space_id                 = local.dev_space_id
 # project_root             = each.value.project_root
 # description              = each.value.description
 # environment              = local.environment
 # additional_project_globs = each.value.additional_project_globs

#  common_labels = merge(
#    local.common_labels,
#    { "app" = each.key }
#  )

#  policy_ids_to_attach  = each.value.policy_ids
#  context_ids_to_attach = each.value.context_ids
#}




resource "spacelift_stack" "test" {
  name       = "test-stack"
  repository = "leonlaf66/spacelift-demo"
  branch     = "main"
#  space_id   = "aws-dev-01K5CD5P72YQ542KFHQVCZYJDW"
}