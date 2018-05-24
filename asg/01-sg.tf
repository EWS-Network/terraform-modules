
resource "aws_security_group" "app_sg" {

    name        = "${format("%s-sg", var.app_name)}"
    description = "${format("Main SG for %s", var.app_name)}"


    vpc_id = "${var.vpc_id}"

    egress {
	from_port   = 0
	to_port     = 0
	protocol    = -1
	cidr_blocks = ["0.0.0.0/0"]
    }

    tags {
	Name = "${format("%s-sg", var.app_name)}"
    }
}
