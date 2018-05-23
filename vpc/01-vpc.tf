################################################################################
##
## VPC

resource "aws_vpc" "vpc_root" {
  cidr_block = "${var.cidr}"

  enable_dns_support   = "${var.use_dns_support}"
  enable_dns_hostnames = "${var.use_dns_hostnames}"

  instance_tenancy = "${var.instance_tenancy}"

  tags {
    Name      = "${var.vpc_name}"
    Terraform = "Yes"
  }
}

################################################################################
##
## Internet GW

resource "aws_internet_gateway" "vpc_gw" {
  vpc_id = "${aws_vpc.vpc_root.id}"
}
