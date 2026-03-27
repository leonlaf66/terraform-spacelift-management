variable "prod_space_id" {
  description = "The space ID to create."
  type        = map(string)
  default = {
    "aws"   = "aws-prod-01K5CD6C5VHW724JMJFHJXZE9K"
    "azure" = "azure-01KH6QECZBDEWHHXJA37F9QA0Y"
  }
}
