resource "aws_vpc" "vpc" {
  cidr_block              = "${var.vpc_cidr}"
  enable_dns_support      = true
  enable_dns_hostnames    = true

  tags {
    Name                  = "VPC"
  }
}

resource "aws_subnet" "pub_sbn_1a" {
  vpc_id                  = "${aws_vpc.vpc.id}"
  cidr_block              = "${var.pub_sbn_1a_cidr}"
  map_public_ip_on_launch = true
  availability_zone       = "ap-southeast-1a"

  tags {
    Name                  = "Pub-Sbn-1a"
    AvailabilityZone      = "Ap-Southeast-1a"
    Purpose               = "Public Subnet A"
  }
}

resource "aws_subnet" "pub_sbn_1b" {
  vpc_id                  = "${aws_vpc.vpc.id}"
  cidr_block              = "${var.pub_sbn_1b_cidr}"
  map_public_ip_on_launch = true
  availability_zone       = "ap-southeast-1b"

 tags {
    Name                  = "Pub-Sbn-1b"
    AvailabilityZone      = "Ap-Southeast-1b"
    Purpose               = "Public Subnet B"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id                  = "${aws_vpc.vpc.id}"

  tags {
    Name                  = "IGW"
  }
}

resource "aws_route" "vpc_route" {
  route_table_id          = "${aws_vpc.vpc.main_route_table_id}"
  destination_cidr_block  = "0.0.0.0/0"
  gateway_id              = "${aws_internet_gateway.igw.id}"
}

resource "aws_route_table" "vpc_table" {
  vpc_id                  = "${aws_vpc.vpc.id}"

  tags {
    Name                  = "VPC-Routing"
  }
}

resource "aws_route_table_association" "pub_sbn_1a_association" {
  subnet_id               = "${aws_subnet.pub_sbn_1a.id}"
  route_table_id          = "${aws_route_table.vpc_table.id}"
}

resource "aws_route_table_association" "pub_sbn_1b_association" {
  subnet_id               = "${aws_subnet.pub_sbn_1b.id}"
  route_table_id          = "${aws_route_table.vpc_table.id}"
}
