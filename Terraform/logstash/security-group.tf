resource "aws_security_group" "logstash" {
  vpc_id = "${var.vpc_id}"
  name = "Logstash Security Group"
  description = "The Security Group for Logstash"

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = []
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "Logstash Security Group"
  }
}

output "sg_id" {
  value = "${aws_security_group.logstash.id}}"
}