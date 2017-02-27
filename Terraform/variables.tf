variable "region" {
  description = "The AWS region you want to deploy the environment to."
  default     = "eu-west-1"
}

variable "profile" {
  description = "The profile you want to use inside your ~/.aws/credentials file."
  default     = "default"
}

variable "global_ami_id" {
  description = "The AMI ID to be used across all instances. You can specify a different ID in the individual config."
  default     = "ami-7abd0209"
}

variable "global_instance_type" {
  description = "The instance size to be used across all instances. You can specify a different size in the individual config."
  default     = "t2.nano"
}