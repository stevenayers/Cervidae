resource "aws_instance" "ec2" {
  ami                         = "${var.ami_id}"
  instance_type               = "${var.instance_type}"
  subnet_id                   = "${var.subnet_id}"
  vpc_security_group_ids      = ["${var.sg_id}", "${var.default_sg_id}"]
  associate_public_ip_address = false
  key_name                    = "${var.key_pair}"

  tags {
    Name = "${var.server_type}"
  }
}

resource "aws_eip" "ec2" {
  instance = "${aws_instance.ec2.id}"
  vpc      = true
}

resource "null_resource" "bootstrap" {
  triggers {
    ec2_id = "${aws_eip.ec2.id}, ${aws_instance.ec2.id}"
  }

  provisioner "file" {
    source      = "${path.module}/bootstrap.sh"
    destination = "/tmp/bootstrap.sh"
    connection {
      type        = "ssh"
      user        = "${var.remote_user}"
      private_key = "${file("${path.root}/private_keys/${var.private_key_path}")}"
      host        = "${aws_eip.ec2.public_ip}"
    }
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/bootstrap.sh",
      "/tmp/bootstrap.sh ${var.server_type}"
    ]
    connection {
      type        = "ssh"
      user        = "${var.remote_user}"
      private_key = "${file("${path.root}/private_keys/${var.private_key_path}")}"
      host        = "${aws_eip.ec2.public_ip}"
    }
  }
}