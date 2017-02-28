##################################################################################################################
#                                                                                                                #
# The Amazon Web Services (AWS) AWS_VPC Resource provisions and configures a VPC.                                #
#                                                                                                                #
# Amazon Virtual Private Cloud (Amazon VPC) lets you provision a logically isolated section of the Amazon        #
# Web Services (AWS) cloud where you can launch AWS resources in a virtual network that you define. You have     #
# complete control over your virtual networking environment, including selection of your own IP address range,   #
# creation of subnets, and configuration of route tables and network gateways.  You can use both IPv4 and IPv6   #
# in your VPC for secure and easy access to resources and applications.                                          #
#                                                                                                                #
# Further reading: https://www.terraform.io/docs/providers/aws/r/vpc.html                                        #
#                                                                                                                #
#                                                                                                                #
# The Amazon Web Services (AWS) AWS_INTERNET_GATEWAY Resource provisions and configures an Internet Gateway.     #
#                                                                                                                #
# An Internet gateway serves two purposes: to provide a target in your VPC route tables for Internet-routable    #
# traffic, and to perform network address translation (NAT) for instances that have been assigned public         #
# IPv4 addresses.                                                                                                #
#                                                                                                                #
# Further reading: https://www.terraform.io/docs/providers/aws/r/internet_gateway.html                           #
#                                                                                                                #
#                                                                                                                #
# Output variables are used upstream in the root project, and passed into the EC2 component modules.             #
#                                                                                                                #
# Further reading: https://www.terraform.io/docs/configuration/outputs.html                                      #
#                                                                                                                #
##################################################################################################################

resource "aws_vpc" "default" {
  cidr_block           = "${var.vpc_cidr}"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags {
    Name = "${var.label}"
  }
}

resource "aws_internet_gateway" "default" {
  vpc_id = "${aws_vpc.default.id}"
  tags {
    Name = "${var.label}"
  }
}
output "vpc_id" {
  value = "${aws_vpc.default.id}"
}