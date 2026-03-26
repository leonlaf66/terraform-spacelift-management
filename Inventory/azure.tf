locals {
  azure_stacks = {
    "azure-test" = {
      description                     = "Manages data-plane application demo."
      repository                      = "terraform-azure-test"
      space_id                        = var.space_ids["azure"]
      project_root                    = var.environment
      azure_integration_ids_to_attach = [var.azure_integration_id]
    }
  }
}
