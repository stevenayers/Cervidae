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

variable "key_pair" {
  description = "This is the key pair used by all instances. You can set these individually in an instance's module."
  default     = "cervidae"
}

variable "private_key_path" {
  description = "File name of private key used to access all instances. Please store in private_keys dir in project root. You can set these individually in an instance's module."
  default     = "cervidae.pem"
}

variable "vpc_cidr" {
  description = "The CIDR block that defines the address space of the Cervidae VPC."
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "The CIDR block that defines the address space of the Cervidae Subnet."
  default     = "10.0.0.0/24"
}

variable "network_label" {
  description = "The value of this variable will be used to label the VPC, Subnet etc. in your AWS console."
  default = "Cervidae"
}

variable "bucket_name" {
  description = "Name of the bucket used to store Cervidae data"
  default = "cervidae"
}