################################################################################
##
## Provider

provider "aws" {
  region = "us-east-1"
}

################################################################################
##
## Variables

variable "app_name" {
  default = "app"
}

variable "role_path" {
    default = "/"
}
variable "role_desc" {
    default = "Role to allow assume from EC2 resources to make API Calls"
}
