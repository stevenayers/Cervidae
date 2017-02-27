module "ec2" {
  source        = "../modules/ec2"
  vpc_id        = "${var.vpc_id}"
  instance_type = "${var.instance_type}"
  ami_id        = "${var.ami_id}"
  server_type   = "${var.server_type}"
  key_pair      = "${var.key_pair}"
  subnet_id     = "${var.subnet_id}"
  sg_id         = "${aws_security_group.logstash.id}"
  default_sg_id = "${var.default_sg_id}"
}