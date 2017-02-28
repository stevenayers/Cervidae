##################################################################################################################
#                                                                                                                #
# The Amazon Web Services (AWS) AWS_SECURITY_GROUP Resource provisions and configures a Security Group,          #
# which defines the rules surrounding which ports can allow traffic from which address spaces.                   #
# A security group acts as a virtual firewall that controls the traffic for one or more instances.               #
#                                                                                                                #
# Further reading: https://www.terraform.io/docs/providers/aws/r/security_group.html                             #
#                                                                                                                #
# Output variables are used upstream in the root project, and passed into the EC2 component modules.             #
#                                                                                                                #
# Further reading: https://www.terraform.io/docs/configuration/outputs.html                                      #
#                                                                                                                #
##################################################################################################################

resource "aws_security_group" "default" {
  vpc_id      = "${aws_vpc.default.id}"
  name        = "Cervidae Security Group"
  description = "The default Security Group for the Cervidae instances."

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "Default Security Group"
  }
}

output "default_sg_id" {
  value = "${aws_security_group.default.id}"
}