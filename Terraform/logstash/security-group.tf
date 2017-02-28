##################################################################################################################
#                                                                                                                #
# The Amazon Web Services (AWS) AWS_SECURITY_GROUP Resource provisions and configures a Security Group,          #
# which defines the rules surrounding which ports can allow traffic from which address spaces.                   #
# A security group acts as a virtual firewall that controls the traffic for one or more instances.               #
#                                                                                                                #
# Further reading: https://www.terraform.io/docs/providers/aws/r/security_group.html                             #
#                                                                                                                #
##################################################################################################################

resource "aws_security_group" "logstash" {
  vpc_id      = "${var.vpc_id}"
  name        = "Logstash Security Group"
  description = "The Security Group for Logstash"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = []
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "Logstash Security Group"
  }
}