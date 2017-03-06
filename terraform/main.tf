##################################################################################################################
#                                                                                                                #
# Each component of this project has been split into it's own module. This file is here to stitch those          #
# modules together and allow us to pass down variables which are globally identical.                             #
#                                                                                                                #
# Further reading: https://www.terraform.io/docs/modules/usage.html                                              #
#                                                                                                                #
##################################################################################################################

#
# Network Module - Provisions the VPC, Subnet, Route Table and Security Group for all instances.
#
module "network" {
  source      = "./network"
  region      = "${var.region}"
  profile     = "${var.profile}"
  vpc_cidr    = "${var.vpc_cidr}"
  subnet_cidr = "${var.subnet_cidr}"
  label       = "${var.network_label}"
}

#
# S3 Module - Provisions the S3 Bucket to be used to backup and replicate ELK data. TODO: Testing
#
module "s3" {
  source      = "./s3"
  region      = "${var.region}"
  profile     = "${var.profile}"
  bucket_name = "${var.bucket_name}"
}

#
# Elasticsearch Module - Provisions the EC2 instance which will host Elasticsearch. TODO: Autoscaling
#
module "elasticsearch" {
  source             = "./elasticsearch"
  region             = "${var.region}"
  profile            = "${var.profile}"
  ami_id             = "${var.global_ami_id}"
  instance_type      = "${var.global_instance_type}"
  vpc_id             = "${module.network.vpc_id}"
  subnet_id          = "${module.network.subnet_id}"
  key_pair           = "${var.key_pair}"
  default_sg_id      = "${module.network.default_sg_id}"
  private_key_path   = "${var.private_key_path}"
  internal_zone_id   = "${module.network.internal_zone_id}"
  internal_zone_name = "${var.internal_zone_name}"
}

#
# Logstash Module - Provisions the EC2 instance which will host Logstash. TODO: Autoscaling
#
module "logstash" {
  source           = "./logstash"
  region             = "${var.region}"
  profile            = "${var.profile}"
  ami_id             = "${var.global_ami_id}"
  instance_type      = "${var.global_instance_type}"
  vpc_id             = "${module.network.vpc_id}"
  subnet_id          = "${module.network.subnet_id}"
  key_pair           = "${var.key_pair}"
  default_sg_id      = "${module.network.default_sg_id}"
  private_key_path   = "${var.private_key_path}"
  internal_zone_id   = "${module.network.internal_zone_id}"
  internal_zone_name = "${var.internal_zone_name}"
}

#
# Kibana Module - Provisions the EC2 instance which will host Kibana. TODO: Autoscaling
#
module "kibana" {
  source           = "./kibana"
  region             = "${var.region}"
  profile            = "${var.profile}"
  ami_id             = "${var.global_ami_id}"
  instance_type      = "${var.global_instance_type}"
  vpc_id             = "${module.network.vpc_id}"
  subnet_id          = "${module.network.subnet_id}"
  key_pair           = "${var.key_pair}"
  default_sg_id      = "${module.network.default_sg_id}"
  private_key_path   = "${var.private_key_path}"
  internal_zone_id   = "${module.network.internal_zone_id}"
  internal_zone_name = "${var.internal_zone_name}"
}
