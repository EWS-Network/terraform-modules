
resource "aws_iam_instance_profile" "app_profile" {
    name = "${format("ec2App-%s", var.app_name)}"
    role = "${aws_iam_role.role.name}"
}

resource "aws_iam_role" "role" {
    name = "${format("ec2App-%s", var.app_name)}"
    path = "/"
    assume_role_policy = "${file("${path.module}/files/iam_ec2_assume.json")}"
}

resource "aws_launch_configuration" "app_lc" {

    image_id      = "${var.ami_id}"
    instance_type = "${var.instance_type}"
    key_name = "${var.keypair_name}"

    user_data = "${var.user_data}"

    iam_instance_profile = "${aws_iam_instance_profile.app_profile.name}"

    security_groups = ["${aws_security_group.app_sg.id}"]

    lifecycle {
	create_before_destroy = true
    }
}

resource "aws_autoscaling_group" "app_asg" {

    desired_capacity     = 1
    max_size             = 1
    min_size             = 1
    launch_configuration = "${aws_launch_configuration.app_lc.name}"

    vpc_zone_identifier = "${var.subnets_ids}"

    tag {
	key                 = "Name"
	value               = "${var.app_name}"
	propagate_at_launch = true
    }

    tag {
	key                 = "Env"
	value               = "${var.env}"
	propagate_at_launch = true
    }
    tag {
	key                 = "AppName"
	value               = "${var.app_name}"
	propagate_at_launch = true
    }

    tag {
	key                 = "Usage"
	value               = "App"
	propagate_at_launch = true
    }

    tag {
	key                 = "Terraform"
	value               = "True"
	propagate_at_launch = true
    }

    lifecycle {
	create_before_destroy = true
    }
}
