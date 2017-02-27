variable "region" {
  description = "The AWS region you want to deploy this instance to. This value is overriden in ../main.tf."
  default     = "eu-west-1"
}

variable "profile" {
  description = "The profile you want to use inside your ~/.aws/credentials file. This value is overriden in ../main.tf."
  default     = "default"
}

variable "vpc_cidr" {
  description = "The CIDR block that defines the address space of the Cervidae VPC."
}

variable "subnet_cidr" {
  description = "The CIDR block that defines the address space of the Cervidae Subnet."
}

variable "label" {
  description = "The label used for Cervidae Network Components."
  default     = "default"
}