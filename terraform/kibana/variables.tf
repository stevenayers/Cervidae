##################################################################################################################
#                                                                                                                #
# Each component of this project has been split into it's own module. This file is here to pass in               #
# component-specific values.                                                                                     #
#                                                                                                                #
# WARNING: Some of these variables will be overriden with values passed in further upstream in the root          #
# of the project (main.tf). You will need to remove or comment out the variable in the module definition.        #
#                                                                                                                #
# Further reading: https://www.terraform.io/docs/configuration/variables.html                                    #
#                                                                                                                #
##################################################################################################################

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
  default     = "kibana"
}

variable "key_pair" {
  description = "The Key Pair to be used on this instance."
}

variable "private_key_path" {
  description = "File name of private key used to access instance. Please store in private_keys dir in project root."
}

variable "default_sg_id" {
  description = "The ID for the security group applied to all instances. This is defined in the network module."
}
