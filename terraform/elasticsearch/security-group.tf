##################################################################################################################
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
##################################################################################################################

resource "aws_security_group" "elasticsearch" {
  vpc_id      = "${var.vpc_id}"
  name        = "Elasticsearch Security Group"
  description = "The Security Group for Elasticsearch"

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
    Name = "Elasticsearch Security Group"
  }
}