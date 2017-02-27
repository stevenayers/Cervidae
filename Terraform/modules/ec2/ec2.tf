resource "aws_instance" "ec2" {
  ami = "${var.ami_id}"
  instance_type = "${var.instance_type}"
  subnet_id = "${var.subnet_id}"
  vpc_security_group_ids = ["${aws_security_group.default.id}", "${aws_security_group.default.id}"]
  associate_public_ip_address = false
  key_name = "${var.key_pair}"

  tags {
    Name = "${var.server_type}"
  }
}

resource "aws_eip" "ec2" {
  instance = "${aws_instance.ec2.id}"
  vpc = true
}

resource "null_resource" "bootstrap" {
  triggers {
    ec2_id = "${aws_eip.ec2.id}, ${aws_instance.ec2.id}"
  }

  provisioner "remote-exec" {
    script = "bootstrap.sh"

    connection {
      timeout = "5m"
      type = "ssh"
      user = "ec2-user"
      host = "${aws_instance.ec2.public_ip}"
      agent = true
    }
  }
}