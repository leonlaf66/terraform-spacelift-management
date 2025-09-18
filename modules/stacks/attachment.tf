resource "spacelift_policy_attachment" "this" {
  for_each = toset(var.policy_ids_to_attach)

  policy_id = each.key
  stack_id  = spacelift_stack.app.id
}

resource "spacelift_context_attachment" "this" {
  for_each = toset(var.context_ids_to_attach)

  context_id = each.key
  stack_id   = spacelift_stack.app.id
}

resource "spacelift_aws_integration_attachment" "this" {
  for_each = toset(var.aws_integration_ids_to_attach)

  integration_id = each.key
  stack_id       = spacelift_stack.app.id
  read           = var.aws_attachment_read
  write          = var.aws_attachment_write
}

output "debug_info" {
  value = {
    stack_id                      = spacelift_stack.app.id
    policy_ids_to_attach          = var.policy_ids_to_attach
    aws_integration_ids_to_attach = var.aws_integration_ids_to_attach
    policy_attachments_created    = keys(spacelift_policy_attachment.this)
    aws_attachments_created       = keys(spacelift_aws_integration_attachment.this)
  }
}