resource "aws_route53_record" "internal" {
  zone_id = "${var.internal_zone_id}"
  name = "${var.server_type}.${var.internal_zone_name}"
  type = "A"
  ttl = "86400"
  records = ["${aws_eip.ec2.private_ip}"]
}