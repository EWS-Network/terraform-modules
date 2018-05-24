

module "tf_asg" "web_asg" {

    source = "github.com/ews-network/terraform-modules/asg"

    ami_id		= "${data.aws_ami.centos.id}"

    subnets_ids		= ["${data.aws_subnet_ids.app.*.id}"]
    vpc_id		= "${data.aws_vpc.root.id}"

    user_data		= "${data.template_cloudinit_config.config.rendered}"
}
