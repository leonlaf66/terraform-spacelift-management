variable "dev_space_id" {
  description = "The space ID to create."
  type        = map(string)
  default = {
    "aws"   = "aws-dev-01K5CD5P72YQ542KFHQVCZYJDW"
    "azure" = "azure-01KH6QECZBDEWHHXJA37F9QA0Y"
  }
}
