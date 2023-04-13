output "vpc_ID" {
  description = "The ID of the VPC created"
  value       = aws_vpc.Main.id
}

output "igw_ID" {
  description = "The internet gateway ID"
  value       = aws_internet_gateway.gw.id
}
