
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


module "tf_asg" "web_asg" {

    source = "github.com/ews-network/terraform-modules/asg"

    ami_id		= "${aws_ami.centos.id}"

    subnets_ids		= ["${data.aws_subnet_ids.app.*.id}"]
    vpc_id		= "${data.aws_vpc.vpc_root.id}"

    user_data		= "${data.template_cloudinit_config.config.rendered}"
}
