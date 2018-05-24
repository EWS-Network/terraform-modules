################################################################################
##
## VAR

variable "region" {
  default = "eu-west-1"
}

variable "cidr" {
  default = "192.168.0.0/22"
}

variable "vpc_name" {
  default = "Dev"
}

variable "env" {
  default = "dev"
}

variable "azs" {
  default = 0
}

################################################################################
##
## Default settings

variable "use_dns_support" {
  default = "true"
}

variable "use_dns_hostnames" {
  default = "true"
}

variable "instance_tenancy" {
  default = "default"
}

################################################################################
##
## DATA

data "aws_availability_zones" "available" {}


################################################################################
##
## LOCALS

locals {
  ansible_vars_file_path = "/var/tmp/cf_vars.yml"
}
