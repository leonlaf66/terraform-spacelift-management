output "stacks" {
  description = "Merged stack catalogue for this environment, keyed by stack name."
  value = merge(
    local.aws_stacks,
    local.azure_stacks,
    local.databricks_stacks,
    local.spacelift_stacks,
  )
}
