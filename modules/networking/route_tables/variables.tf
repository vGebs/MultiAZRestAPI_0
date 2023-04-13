variable "vpc_id" {
  description = "The VPC ID."
  type        = string
}

variable "nat_gateway_id" {
  description = "The NAT Gateway ID."
  type        = string
}

variable "internet_gateway_id" {
  description = "The Internet Gateway ID."
  type        = string
}

variable "private_subnet_id" {
  description = "The Private Subnet ID."
  type        = string
}

variable "public_subnet_id" {
  description = "The Public Subnet ID."
  type        = string
}
