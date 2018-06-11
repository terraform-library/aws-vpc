output "igw_id" {
  value       = "${aws_internet_gateway.default.id}"
  description = "The ID of the Internet Gateway"
}

output "vpc_id" {
  value       = "${element(concat(aws_vpc.default.*.id, list("")), 0)}"
  description = "The ID of the VPC"
}

output "vpc_cidr_block" {
  value       = "${element(concat(aws_vpc.default.*.cidr_block, list("")), 0)}"
  description = "The CIDR block of the VPC"
}

output "route_table_id" {
  value       = "${element(concat(aws_vpc.default.*.default_route_table_id, list("")), 0)}"
  description = "The ID of the route table created by default on VPC creation"
}

output "public_vpc_association_id" {
  value       = "${aws_route_table_association.public.id}"
  description = "The association ID for the IP CIDR block"
}

output "private_vpc_association_id" {
  value       = "${aws_route_table_association.private.id}"
  description = "The association ID for the IP CIDR block"
}

# Subnets
output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = ["${aws_subnet.private.*.id}"]
}

output "private_subnets_cidr_blocks" {
  description = "List of cidr_blocks of private subnets"
  value       = ["${aws_subnet.private.*.cidr_block}"]
}

output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = ["${aws_subnet.public.*.id}"]
}

output "public_subnets_cidr_blocks" {
  description = "List of cidr_blocks of public subnets"
  value       = ["${aws_subnet.public.*.cidr_block}"]
}