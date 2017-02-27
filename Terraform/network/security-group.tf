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