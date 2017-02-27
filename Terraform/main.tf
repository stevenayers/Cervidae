module "network" {
  source      = "./network"
  region      = "${var.region}"
  profile     = "${var.profile}"
  vpc_cidr    = "10.0.0.0/16"
  subnet_cidr = "10.0.0.0/24"
  label       = "Cervidae"
}

module "s3" {
  source  = "./s3"
  region  = "${var.region}"
  profile = "${var.profile}"
}

module "elasticsearch" {
  source        = "./elasticsearch"
  region        = "${var.region}"
  profile       = "${var.profile}"
  ami_id        = "${var.global_ami_id}"
  instance_type = "${var.global_instance_type}"
  vpc_id        = "${module.network.vpc_id}"
  subnet_id     = "${module.network.subnet_id}"
  server_type   = "elasticsearch"
  key_pair      = ""
  default_sg_id = "${module.network.default_sg_id}"
}

module "kibana" {
  source        = "./kibana"
  region        = "${var.region}"
  profile       = "${var.profile}"
  ami_id        = "${var.global_ami_id}"
  instance_type = "${var.global_instance_type}"
  vpc_id        = "${module.network.vpc_id}"
  subnet_id     = "${module.network.subnet_id}"
  server_type   = "kibana"
  key_pair      = ""
  default_sg_id = "${module.network.default_sg_id}"
}

module "logstash" {
  source        = "./logstash"
  region        = "${var.region}"
  profile       = "${var.profile}"
  ami_id        = "${var.global_ami_id}"
  instance_type = "${var.global_instance_type}"
  vpc_id        = "${module.network.vpc_id}"
  subnet_id     = "${module.network.subnet_id}"
  server_type   = "logstash"
  key_pair      = ""
  default_sg_id = "${module.network.default_sg_id}"
}