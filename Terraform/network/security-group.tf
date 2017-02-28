##################################################################################################################
#                                                                                                                #
# This Security Group is applied to all instances.                                                               #
#                                                                                                                #
#                                                                                                                #
# The Amazon Web Services (AWS) AWS_SECURITY_GROUP Resource provisions and configures a Security Group.          #
#                                                                                                                #
# A security group acts as a virtual firewall that controls the traffic for one or more instances. When you      #
# launch an instance, you associate one or more security groups with the instance. You add rules to each         #
# security group that allow traffic to or from its associated instances.                                         #
#                                                                                                                #
# You can modify the rules for a security group at any time; the new rules are automatically applied to all      #
# instances that are associated with the security group. When we decide whether to allow traffic to reach an     #
# instance, we evaluate all the rules from all the security groups that are associated with the instance.        #
#                                                                                                                #
# Further reading: https://www.terraform.io/docs/providers/aws/r/security_group.html                             #
#                                                                                                                #
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