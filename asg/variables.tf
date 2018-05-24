################################################################################
##
## Variables

variable "region" {
  default = "eu-west-1"
}

variable "vpc_id" {
}

variable "subnets_ids"{
}

variable "ami_id" {
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
## Provider

provider "aws" {
  region = "${var.region}"
}
