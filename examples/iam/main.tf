

module "tf_iam_profile" "bastion_profile" {

    source = "/home/john/terraform-modules/iam_instance_profile"

    app_name = "hello_world"
}
