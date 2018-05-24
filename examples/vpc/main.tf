

module "tf_vpc" {

    source = "github.com/ews-network/terraform-modules/vpc"

    cidr = "172.26.0.0/20"
    env = "dev"

}
