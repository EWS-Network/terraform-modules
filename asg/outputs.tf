
output "asg_id" {
    value = "${aws_autoscaling_group.app_asg.id}"
}

output "lc_name" {
    value = "${aws_launch_configuration.app_lc.name}"
}
