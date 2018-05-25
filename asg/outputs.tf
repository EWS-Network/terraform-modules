
output "asg_id" {
    value = "${aws_autoscaling_group.asg.id}"
}

output "lc_name" {
    value = "${aws_launch_configuration.lc.name}"
}
