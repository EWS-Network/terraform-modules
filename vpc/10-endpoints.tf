################################################################################
##
## Service Endpoints

# S3

resource "aws_vpc_endpoint" "s3_non_app" {
  vpc_id       = "${aws_vpc.vpc_root.id}"
  service_name = "${format("com.amazonaws.%s.s3", var.region)}"

  route_table_ids = [
    "${element(aws_route_table.stor_rtb.*.id, count.index)}",
    "${element(aws_route_table.pub_rtb.*.id, count.index)}",
  ]

  depends_on = ["aws_route_table.pub_rtb", "aws_route_table.stor_rtb"]
}

resource "aws_vpc_endpoint" "s3_app" {
  vpc_id       = "${aws_vpc.vpc_root.id}"
  service_name = "${format("com.amazonaws.%s.s3", var.region)}"

  route_table_ids = ["${element(aws_route_table.app_rtb.*.id, count.index)}"]

  depends_on = ["aws_route_table.app_rtb"]
}
