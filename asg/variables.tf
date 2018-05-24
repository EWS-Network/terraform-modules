################################################################################
##
## Variables

variable "region" {
  default = "eu-west-1"
}

variable "vpc_id" {
    default = ""
}

variable "env" {
  default = "dev"
}

variable "instance_type" {
  default = "t2.small"
}

variable "keypair_name" {
  default = ""
}

variable "app_name" {
  default = "app"
}

variable "user_data" {
    default = ""
}

################################################################################
##
## locals

locals {
  ansible_vars_file_path = "/var/tmp/cf_vars.yml"
}

################################################################################
##
## Data


data "aws_vpc" "root" {
  tags {
    Name = "${var.vpc_name}"
  }
}

data "aws_subnet_ids" "app" {
  vpc_id = "${data.aws_vpc.root.id}"

  tags {
    Usage = "Public"
  }
}


################################################################################
##
## Provider

provider "aws" {
  region = "${var.region}"
}
