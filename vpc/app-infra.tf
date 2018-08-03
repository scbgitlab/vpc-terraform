resource "aws_instance" "php_srv" {
  ami                         = "${var.php_srv_ami}"
  instance_type               = "${var.php_srv_ins_type}"
  associate_public_ip_address = true
  subnet_id                   = "${aws_subnet.pub_sbn_1a.id}"
  vpc_security_group_ids      = ["${aws_security_group.php_srv_sg.id}", "${aws_security_group.php_http_sg.id}"]

  tags {
    Name                    = "SRV-PUB-01A"
    Purpose                 = "Web server"
    Application             = "Wordpress"
  }
}

resource "aws_eip" "php_srv_ip" {
  vpc                         = true
  depends_on                  = ["aws_instance.php_srv"]
}

resource "aws_eip_association" "php_srv_ip_associate" {
  instance_id                 = "${aws_instance.php_srv.id}"
  allocation_id               = "${aws_eip.php_srv_ip.id}"
}      


resource "aws_rds_cluster" "aurora_cluster" {
  cluster_identifier          = "${var.rds_cluster_identifier}" 
  database_name               = "${var.rds_database_name}" 
  master_username             = "${var.rds_master_username}" 
  master_password             = "${var.rds_master_password}"
  db_subnet_group_name        = "${aws_db_subnet_group.rds_pub_sbn_grp.name}"
  vpc_security_group_ids      = ["${aws_security_group.php_rds_sg.id}"]
  skip_final_snapshot         = true
  final_snapshot_identifier   = "final-snapshot"

  tags {
    Name                    = "RDS-Cluster"
    Purpose                 = "RDS aurora cluster"    
  }
}

resource "aws_rds_cluster_instance" "aurora_cluster_instance" {
  count                       = "1"
  identifier                  = "${var.rds_instance_identifier}" 
  cluster_identifier          = "${aws_rds_cluster.aurora_cluster.id}"
  instance_class              = "${var.rds_instance_class}"
  db_subnet_group_name        = "${aws_db_subnet_group.rds_pub_sbn_grp.name}"
  publicly_accessible         = "${var.rds_publicly_accessible}"
    
  tags {
    Name                    = "RDS-Instance"
    Purpose                 = "RDS aurora instance"
  }
}

resource "aws_db_subnet_group" "rds_pub_sbn_grp" {
  name                        = "rds_pub_sbn_grp"
  description                 = "RDS subnet group."
  subnet_ids                  = ["${aws_subnet.pub_sbn_1a.id}", "${aws_subnet.pub_sbn_1b.id}"]
}



