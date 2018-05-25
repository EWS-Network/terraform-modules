
resource "aws_iam_instance_profile" "profile" {
    name = "${format("ec2-%s", var.app_name)}"
    role = "${aws_iam_role.role.name}"
}

resource "aws_iam_role" "role" {
    name = "${format("ec2-%s", var.app_name)}"
    path = "${var.role_path}"
    description = "${var.role_desc}"
    assume_role_policy = "${file("${path.module}/files/iam_ec2_assume.json")}"
}
