resource "aws_security_group" "php_srv_sg" {
  name          = "SG-SRV-SSH"
  description   = "Allow SSH access to the PHP server."
  vpc_id        = "${aws_vpc.vpc.id}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["${var.php_srv_ssh_ing_cidr}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["${var.php_srv_ssh_egr_cidr}"]
  }

  tags {
    Name        = "SG-SRV-SSH"
    Purpose     = "SRV SSH connection."
    Application = "AWS SG"
  }
}

resource "aws_security_group" "php_http_sg" {
  name          = "SG-SRV-HTTP"
  description   = "Allow HTTP access to the web server."
  vpc_id        = "${aws_vpc.vpc.id}"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "TCP"
    cidr_blocks = ["${var.php_srv_http_ing_cidr}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["${var.php_srv_http_egr_cidr}"]
  }

  tags {
    Name        = "SG-SRV-HTTP"
    Purpose     = "SRV HTTP connection."
    Application = "AWS SG"
  }
}
