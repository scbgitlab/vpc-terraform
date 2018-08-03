variable "aws_region" {
  description = "AWS EC2 Region for the VPC."
  default     = "ap-southeast-1"
}

variable "vpc_cidr" {
  description = "CIDR block for subnet DEV-VPC."
  default     = "192.168.1.0/24"
}

variable "pub_sbn_1a_cidr" {
  description = "CIDR block for subnet Dev-Pub-Subnet-1a."
  default     = "192.168.1.0/27"
}


variable "pub_sbn_1b_cidr" {
  description = "CIDR block for subnet Dev-Pub-Subnet-1b."
  default     = "192.168.1.32/27"
}


variable "php_srv_ami" {
  description = "PHP server AMI."
  default     = "ami-de90a5a2"
}


variable "php_srv_ins_type" {
  description = "PHP server instance type."
  default     = "t2.micro"
}


variable "php_srv_ssh_ing_cidr" {
  description = "Inbound IP address for SSH access on security group.."
  default     = "192.168.0.0/24"
}


variable "php_srv_ssh_egr_cidr" {
  description = "Outbound IP address for SSH access on security group.."
  default     = "192.168.0.0/24"
}



variable "php_srv_http_ing_cidr" {
  description = "Inbound IP address for HTTP access on security group."
  default     = "0.0.0.0/0"
}


variable "php_srv_http_egr_cidr" {
  description = "Outbound IP address for SSH access on security group."
  default     = "0.0.0.0/0"
}


variable "rds_ing_cidr" {
  description = "Inbound IP address for RDS access on security group."
  default     = "192.168.1.0/24"
}

variable "rds_egr_cidr" {
  description = "Outbound IP address for RDS access on security group."
  default     = "192.168.1.0/24"
}


variable "rds_publicly_accessible" {
  description = "RDS publicly accessible option."
  default     = "true"
}


variable "rds_instance_class" {
  description = "RDS instance class."
  default     = "db.t2.small"
}

variable "rds_database_name" {
  description = "RDS database name."
  default     = "mydb"
}

variable "rds_master_username" {
  description = "RDS user name."
  default     = "acnadmin"
}

variable "rds_master_password" {
  description = "RDS password."
  default     = "acndemo125"
}

variable "rds_cluster_identifier" {
  description = "RDS cluster identifier."
  default     = "rds-cls"
}

variable "rds_instance_identifier" {
  description = "RDS instance identifier."
  default     = "rds-ins"
}

variable "rds_engine" {
  description = "RDS engine."
  default     = "aurora-mysql"
}

variable "rds_skip_final_snapshot" {
  description = "RDS skip final snapshot option."
  default     = "true"
}

variable "rds_name_pub_sbn_grp" {
  description = "RDS Public Subnet Name"
  default     = "rds_pub_subnet"
}
