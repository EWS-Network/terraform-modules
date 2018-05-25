################################################################################
##
## Outputs

output "profile_arn" {
    value = "${aws_iam_instance_profile.profile.arn}"
}

output "profile_role" {
    value = "${aws_iam_instance_profile.profile.role}"
}

output "profile_id" {
    value = "${aws_iam_instance_profile.profile.unique_id}"
}

output "role_arn" {
    value = "${aws_iam_role.role.arn}"
}

output "role_name" {
    value = "${aws_iam_role.role.name}"
}

output "role_id" {
    value = "${aws_iam_role.role.unique_id}"
}

output "role_description" {
    value = "${aws_iam_role.role.description}"
}

