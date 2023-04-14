variable "vpc_id" {
  description = "The ID of the VPC the NACL resides in"
  type        = string
}

variable "private_subnet_cidr" {
  description = "Private subnet CIDR that we are sending traffic to"
  type        = string
}

variable "public_lb_subnet_cidr" {
  description = "The subnet cidr of the load balancer subnet"
  type        = string
}

variable "lb_public_subnet_id" {
  description = "The public load balancer subnet ID"
  type        = string
}

variable "app_private_subnet_id" {
  description = "The private app server subnet ID"
  type        = string
}

variable "nat_gateway_public_subnet_id" {
  description = "The nat gateway public subnet ID"
  type        = string
}

