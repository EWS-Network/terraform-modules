
## AMI

data "aws_ami" "centos" {
    most_recent = true

    filter {
	name   = "architecture"
	values = ["x86_64"]
    }

    filter {
	name   = "name"
	values = ["CentOS Linux 7 x86_64 HVM EBS*ENA*"]
    }

    filter {
	name   = "virtualization-type"
	values = ["hvm"]
    }

    owners = ["679593333241"] # MarketPlace
}


## VPC

data "aws_vpc" "root" {
  tags {
    Name = "${var.vpc_name}"
  }
}


## Subnet(s)

data "aws_subnet_ids" "app" {
  vpc_id = "${data.aws_vpc.root.id}"

  tags {
    Usage = "Application"
  }
}


# User-Data files etc. via Cloud-init

data "template_file" "cloud-init" {
  template = "${file("${path.module}/templates/os-settings.yml")}"
  vars     = {}
}

data "template_file" "repos" {
  template = "${file("${path.module}/templates/repos.yml")}"
  vars     = {}
}

data "template_file" "ansible_playbook" {
  template = "${file("${path.module}/templates/site.yml")}"

  vars = {
    ansible_vars_file_path = "${local.ansible_vars_file_path}"
  }
}

data "template_file" "ansible_vars" {
  template = "${file("${path.module}/templates/vars.yml")}"
  vars     = {}
}

data "template_file" "ansible_config" {
  template = "${file("${path.module}/templates/ansible-config.yml")}"

  vars {
    ansible_vars_file_path = "${local.ansible_vars_file_path}"
    b64_content_site_yaml  = "${base64encode(data.template_file.ansible_playbook.rendered)}"
    b64_content_vars_yaml  = "${base64encode(data.template_file.ansible_vars.rendered)}"
  }
}


data "template_cloudinit_config" "config" {
  gzip          = true
  base64_encode = true

  part {
    filename     = "000-repos.yml"
    content_type = "text/cloud-config"
    content      = "${data.template_file.repos.rendered}"
  }

  part {
    filename     = "001-os_settings.yml"
    content_type = "text/cloud-config"
    content      = "${data.template_file.cloud-init.rendered}"
  }

  part {
    filename     = "002-ansible_settings.yml"
    content_type = "text/cloud-config"
    content      = "${data.template_file.ansible_config.rendered}"
  }
}
