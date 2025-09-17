# modules/stacks/versions.tf

terraform {
  required_providers {
    spacelift = {
      source  = "spacelift-io/spacelift"
      version = "~> 1.33.0"
    }
  }
}