##################################################################################################################
#                                                                                                                #
# The Amazon Web Services (AWS) AWS_VPC Resource provisions and configures a VPC.                                #
#                                                                                                                #
# Further reading: https://www.terraform.io/docs/providers/aws/r/vpc.html                                        #
#                                                                                                                #
# The Amazon Web Services (AWS) AWS_INTERNET_GATEWAY Resource provisions and configures an internet gateway.     #
#                                                                                                                #
# Further reading: https://www.terraform.io/docs/providers/aws/r/internet_gateway.html                           #
#                                                                                                                #
# The vpc_id output variable is used upstream in the root project, and passed into the EC2 component modules.    #
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