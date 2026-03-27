locals {
  databricks_stacks = {
    "dbx-workspace-demo" = {
      description                   = "Manages infrastructure for databricks demo workspace."
      repository                    = "databricks-workspace-demo"
      space_id                      = var.space_ids["aws"]
      project_root                  = var.environment
      aws_integration_ids_to_attach = [var.aws_integration_id]
      context_ids_to_attach         = ["databricks-accounts-provider-creds", "databricks-demo"]
    }
  }
}
