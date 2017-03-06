resource "aws_route53_zone" "internal" {
  name   = "cervidae.internal"
  vpc_id = "${aws_vpc.default.id}"
}

output "internal_zone_id" {
  value = "${aws_route53_zone.internal.id}"
}