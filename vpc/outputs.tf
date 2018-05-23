################################################################################
##
## Outputs

output "vpc_id" {
  value = "${aws_vpc.vpc_root.id}"
}

output "public_subnets_ids" {
  value = "${aws_subnet.pub_vpc_subnets.*.id}"
}

output "application_subnets_ids" {
  value = "${aws_subnet.app_vpc_subnets.*.id}"
}

output "storage_subnets_ids" {
  value = "${aws_subnet.stor_vpc_subnets.*.id}"
}

output "internetgw_id" {
  value = "${aws_internet_gateway.vpc_gw.id}"
}
