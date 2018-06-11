module "label" {
  source      = "git::https://github.com/terraform-library/null-label.git?ref=master"
  name        = "${var.name}"
  environment = "${var.environment}"
  managedby   = "${var.managedby}"
  delimiter   = "${var.delimiter}"
}

terraform {
  required_version = ">= 0.11.7" # introduction of Local Values configuration language feature
}

locals {
  max_subnet_length = "${max(length(var.private_subnets))}"
}


######
# VPC
######
resource "aws_vpc" "default" {
  count = "${var.create_vpc ? 1 : 0}"

  cidr_block                       = "${var.cidr_block}"
  instance_tenancy                 = "${var.instance_tenancy}"
  enable_dns_hostnames             = "${var.enable_dns_hostnames}"
  enable_dns_support               = "${var.enable_dns_support}"
  enable_classiclink               = "${var.enable_classiclink}"
  enable_classiclink_dns_support   = "${var.enable_classiclink_dns_support}"
  tags                             = "${module.label.tags}"
}

###################
# Internet Gateway
###################
resource "aws_internet_gateway" "default" {
  count = "${var.create_vpc && length(var.public_subnets) > 0 ? 1 : 0}"

  vpc_id = "${aws_vpc.default.id}"
  tags   = "${module.label.tags}"
}

################
# Public subnet
################
resource "aws_subnet" "public" {
  count = "${var.create_vpc && length(var.public_subnets) >  0 ? 1 : 0}"

  vpc_id                  = "${aws_vpc.default.id}"
  cidr_block              = "${var.public_subnets[count.index]}"
  availability_zone       = "${element(var.availabilities_zones, count.index)}"
  map_public_ip_on_launch = "${var.map_public_ip_on_launch}"

  tags   = "${module.label.tags}"
}


################
# Publiс routes
################
resource "aws_route_table" "public" {
  count = "${var.create_vpc && length(var.public_subnets) > 0 ? 1 : 0}"

  vpc_id = "${aws_vpc.default.id}"

  tags   = "${module.label.tags}"
}

resource "aws_route" "public_internet_gateway" {
  count = "${var.create_vpc && length(var.public_subnets) > 0 ? 1 : 0}"

  route_table_id         = "${aws_route_table.public.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.default.id}"
  tags   = "${module.label.tags}"

}

#################################
# Public Route table association
#################################
resource "aws_route_table_association" "public" {
  count = "${var.create_vpc && length(var.public_subnets) > 0 ? length(var.public_subnets) : 0}"

  subnet_id      = "${element(aws_subnet.public.*.id, count.index)}"
  route_table_id = "${element(aws_route_table.public.*.id, count.index)}"
  tags   = "${module.label.tags}"
}

#################
# Private subnet
#################
resource "aws_subnet" "private" {
  count = "${var.create_vpc && length(var.private_subnets) >  0 ? length(var.private_subnets) : 0}"

  vpc_id                          = "${aws_vpc.default.id}"
  cidr_block                      = "${var.private_subnets[count.index]}"
  availability_zone               = "${element(var.availabilities_zones, count.index)}"
  tags                            = "${module.label.tags}"
}

################
# Private routes
################
resource "aws_route_table" "private" {
  count = "${var.create_vpc && length(var.private_subnets) > 0 ? 1 : 0}"

  vpc_id = "${aws_vpc.default.id}"

  tags   = "${module.label.tags}"
}

resource "aws_route" "private_internet_gateway" {
  count = "${var.create_vpc && length(var.private_subnets) > 0 ? 1 : 0}"

  route_table_id         = "${aws_route_table.private.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.default.id}"
  tags   = "${module.label.tags}"
}

##########################
# Private Route table association
##########################
resource "aws_route_table_association" "private" {
  count = "${var.create_vpc && length(var.private_subnets) > 0 ? length(var.private_subnets) : 0}"

  subnet_id      = "${element(aws_subnet.private.*.id, count.index)}"
  route_table_id = "${element(aws_route_table.private.*.id, count.index)}"
  tags   = "${module.label.tags}"
}

