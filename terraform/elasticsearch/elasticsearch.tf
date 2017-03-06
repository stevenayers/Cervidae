##################################################################################################################
#                                                                                                                #
# This is a module defining a single component of the project. You can set component-specific variables          #
# using the variables.tf within this directory. This module pulls in the ec2 module defined in the module        #
# directory.                                                                                                     #
#                                                                                                                #
# Further reading: https://www.terraform.io/docs/modules/usage.html                                              #
#                                                                                                                #
##################################################################################################################

module "ec2" {
  source             = "../modules/ec2"
  vpc_id             = "${var.vpc_id}"
  instance_type      = "t2.medium" #"${var.instance_type}"
  ami_id             = "${var.ami_id}"
  server_type        = "${var.server_type}"
  key_pair           = "${var.key_pair}"
  subnet_id          = "${var.subnet_id}"
  sg_id              = "${aws_security_group.elasticsearch.id}"
  default_sg_id      = "${var.default_sg_id}"
  private_key_path   = "${var.private_key_path}"
  internal_zone_id   = "${var.internal_zone_id}"
  internal_zone_name = "${var.internal_zone_name}"
}