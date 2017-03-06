resource "aws_route53_record" "bastion_dns_name_internal" {
  zone_id = "${var.fnc_internal_zone_id}"
  name = "bastion2.${var.fnc_internal_domain_name}"
  type = "A"
  ttl = "86400"
  records = ["${aws_eip.ec2.private_ip}"]
}