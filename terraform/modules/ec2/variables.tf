##################################################################################################################
#                                                                                                                #
# There are only two variables that should ever be modified in this file:                                        #
#   - remote_user: When you need the connection provisioner to use a different username other than centos.       #
#   - server_type: When the puppet fact 'server_type' isn't set further upstream, you can use a default value    #
#                  here which will allow you to define a default puppet role.                                    #
#                                                                                                                #
# Further reading: https://www.terraform.io/docs/configuration/variables.html                                    #
#                                                                                                                #
##################################################################################################################

variable "ami_id" {
  description = "The AMI ID to be used on this instance."
}

variable "vpc_id" {
  description = "The ID of the VPC used for this environment."
}

variable "subnet_id" {
  description = "The ID of the Subnet used for this environment."
}

variable "instance_type" {
  description = "The instance size to be used on this instance. This value is overriden in"
}

variable "server_type" {
  description = "The server_type value is used inside the bootstrap script to set the server_type, a fact used by Puppet."
  default     = "default"
}

variable "key_pair" {
  description = "The Key Pair to be used on this instance."
}

variable "private_key_path" {
  description = "The path of the private key for the key pair specified in the key_pair variable."
}

variable "default_sg_id" {
  description = "The ID for the security group applied to all instances. This is defined in the network module."
}

variable "sg_id" {
  description = "The ID for the specific instance being passed into this module."
}

variable "remote_user" {
  description = "The account that should be used on the instance for the remote-exec and file provisioner."
  default     = "centos"
}