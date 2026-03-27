variable "prod_space_id" {
  description = "The space ID to create."
  type        = map(string)
  default = {
    "aws"   = "aws-prod-01K5CD6C5VHW724JMJFHJXZE9K"
  }
}
