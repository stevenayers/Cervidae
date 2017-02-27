variable "region" {
  description = "The AWS region you want to deploy this instance to. This value is overriden in ../main.tf."
  default     = "eu-west-1"
}

variable "profile" {
  description = "The profile you want to use inside your ~/.aws/credentials file. This value is overriden in ../main.tf."
  default     = "default"
}
