resource "aws_security_group" "elasticsearch" {
  vpc_id = "${var.vpc_id}"
  name = "Elasticsearch Security Group"
  description = "The Security Group for Elasticsearch"

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
    Name = "Elasticsearch Security Group"
  }
}

output "sg_id" {
  value = "${aws_security_group.elasticsearch.id}}"
}