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


data "spacelift_stacks" "all" {}

output "stack_count" {
  value = length(data.spacelift_stacks.all.stacks)
}

resource "spacelift_stack" "test_different_repo" {
  name       = "test-different-repo"
  repository = "hashicorp/terraform"  # Public repo
  branch     = "main"
}
