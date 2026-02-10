locals {
  dev_space_id                  = "aws-dev-01K5CD5P72YQ542KFHQVCZYJDW"
  dev_branch                    = "main"
  environment                   = "dev"
  github_action_deploy          = true
  dev_aws_integration_id           = "01K48A89P24CVYM1MVETR4YZ19"
  security_group_ingress_policy_id = "security-group-port-policy"
  common_labels                 = {
    "env"        = "dev",
    "managed-by" = "terraform"
  }

  stacks = {
    "spacelift-demo" = {
      description                   = "Manages dev infrastructure for the spacelift demo."
      repository                    = "spacelift-demo"
      project_root                  = local.environment
      additional_project_globs      = ["common_modules/**/*"]
      policy_ids_to_attach          = [local.security_group_ingress_policy_id] 
      aws_integration_ids_to_attach = [local.dev_aws_integration_id]
    },
    "codebuild-infra" = {
      description                   = "Manages dev infrastructure for codebuild repo."
      repository                    = "terraform-codebuild-infra"
      project_root                  = local.environment
      additional_project_globs      = ["modules/**/*"]
      aws_integration_ids_to_attach = [local.dev_aws_integration_id]
    },
    "nodejs-codebuild" = {
      description                   = "Manages dev infrastructure for nodejs codebuild project."
      repository                    = "terraform-codebuild-demo"
      project_root                  = local.environment
      additional_project_globs      = []
      aws_integration_ids_to_attach = [local.dev_aws_integration_id]
    }
    "ec-demo" = {
      description                   = "Manages dev infrastructure for ecs demo."
      repository                    = "terraform-ecs-demo"
      project_root                  = local.environment
      additional_project_globs      = []
      aws_integration_ids_to_attach = [local.dev_aws_integration_id]
    }
    "dbx-workspace-demo" = {
      description                   = "Manages infrastructure for databricks demo workspace."
      repository                    = "databricks-workspace-demo"
      project_root                  = local.environment
      additional_project_globs      = []
      aws_integration_ids_to_attach = [local.dev_aws_integration_id]
      context_ids_to_attach         = ["databricks-accounts-provider-creds","databricks-demo"]
    }
    "data-pipeline-demo-infra" = {
      description                   = "Manages data-pipeline infrastructure demo."
      repository                    = "data-pipeline-demo-project"
      project_root                  = "${local.environment}/infra"
      additional_project_globs      = []
      aws_integration_ids_to_attach = [local.dev_aws_integration_id]
      context_ids_to_attach         = ["kraken-demo-${local.environment}"]
    }
    "data-pipeline-demo-data-plane" = {
      description                   = "Manages data-plane application demo."
      repository                    = "data-pipeline-demo-data-plane"
      project_root                  = "${local.environment}/data-plane"
      additional_project_globs      = []
      aws_integration_ids_to_attach = [local.dev_aws_integration_id]
      context_ids_to_attach         = ["kraken-demo-${local.environment}"]
    }
  }
}