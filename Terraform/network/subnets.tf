##################################################################################################################
#                                                                                                                #
# The Amazon Web Services (AWS) AWS_SUBNET Resource provisions and configures a Subnet, which defines the        #
# address space and network configurations of a subnet within your VPC.                                          #
#                                                                                                                #
# Further reading: https://www.terraform.io/docs/providers/aws/r/subnet.html                                     #
#                                                                                                                #
# The Amazon Web Services (AWS) AWS_ROUTE_TABLE Resource provisions and configures an route table.               #
# A route table contains a set of rules, called routes, that are used to determine where network traffic         #
# is directed.                                                                                                   #
#                                                                                                                #
# Further reading: https://www.terraform.io/docs/providers/aws/r/route_table.html                                #
#                                                                                                                #
# The Amazon Web Services (AWS) AWS_ROUTE_TABLE_ASSOCIATE attaches a Route Table Resource to a Subnet Resource.  #
#                                                                                                                #
# Further reading: https://www.terraform.io/docs/providers/aws/r/route_table.html                                #
#                                                                                                                #
# Output variables are used upstream in the root project, and passed into the EC2 component modules.             #
#                                                                                                                #
# Further reading: https://www.terraform.io/docs/configuration/outputs.html                                      #
#                                                                                                                #
##################################################################################################################

resource "aws_subnet" "default" {
  vpc_id     = "${aws_vpc.default.id}"
  cidr_block = "${var.subnet_cidr}"
  tags {
    Name = "${var.label}"
  }
}
output "frontend_subnet_id" {
  value = "${aws_subnet.default.id}"
}

resource "aws_route_table" "default" {
  vpc_id = "${aws_vpc.default.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.default.id}"
  }
  tags {
    Name = "${var.label}"
  }
}

resource "aws_route_table_association" "default" {
  subnet_id      = "${aws_subnet.default.id}"
  route_table_id = "${aws_route_table.default.id}"
}

output "subnet_id" {
  value = "${aws_subnet.default.id}"
}