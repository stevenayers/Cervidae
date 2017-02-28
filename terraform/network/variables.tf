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