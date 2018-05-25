

module "tf_iam_profile" "bastion_profile" {

    source = "github.com/ews-network/terraform-modules/iam_instance_profile"

    app_name = "hello_world"
}
