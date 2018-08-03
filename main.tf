provider "aws" {
  region = "ap-southeast-1"
}

module "vpc" {
  source                        = "./vpc"
  vpc_cidr                  = "${var.vpc_cidr}"
  pub_sbn_1a_cidr           = "${var.pub_sbn_1a_cidr}"
  pub_sbn_1b_cidr           = "${var.pub_sbn_1b_cidr}"
  php_srv_ami               = "${var.php_srv_ami}"
  php_srv_ins_type          = "${var.php_srv_ins_type}"
  php_srv_ssh_ing_cidr      = "${var.php_srv_ssh_ing_cidr}"
  php_srv_ssh_egr_cidr      = "${var.php_srv_ssh_egr_cidr}"
  php_srv_http_ing_cidr     = "${var.php_srv_http_ing_cidr}"
  php_srv_http_egr_cidr     = "${var.php_srv_http_egr_cidr}"
  rds_instance_class        = "${var.rds_instance_class}"
  rds_master_username       = "${var.rds_master_username}"
  rds_master_password       = "${var.rds_master_password}"
  rds_database_name         = "${var.rds_database_name}"
  rds_cluster_identifier    = "${var.rds_cluster_identifier}"
  rds_instance_identifier   = "${var.rds_instance_identifier}"
  rds_ing_cidr              = "${var.rds_ing_cidr}"
  rds_egr_cidr              = "${var.rds_egr_cidr}"
  rds_publicly_accessible   = "${var.rds_publicly_accessible}" 
  rds_name_pub_sbn_grp      = "${var.rds_name_pub_sbn_grp}"
}