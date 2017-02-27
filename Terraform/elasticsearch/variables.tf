variable "region" {
  description = "The AWS region you want to deploy this instance to. This value is overriden in ../main.tf."
  default     = "eu-west-1"
}

variable "profile" {
  description = "The profile you want to use inside your ~/.aws/credentials file. This value is overriden in ../main.tf."
  default     = "default"
}

variable "ami_id" {
  description = "The AMI ID to be used on this instance. This value is overriden in ../main.tf."
  default     = "ami-7abd0209"
}

variable "vpc_id" {
  description = "The ID of the VPC used for this environment."
}

variable "subnet_id" {
  description = "The ID of the Subnet used for this environment."
}

variable "instance_type" {
  description = "The instance size to be used on this instance. This value is overriden in ../main.tf."
  default     = "t2.nano"
}

variable "server_type" {
  description = "The server_type value is used inside the bootstrap script to set the server_type, a fact used by Puppet."
  default = ""
}

variable "key_pair" {
  description = "The Key Pair to be used on this instance. This value is overriden in ../main.tf."
}