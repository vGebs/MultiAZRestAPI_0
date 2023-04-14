variable "subnets" {
  type        = list(string)
  description = "List of subnets for the ALB"
}

variable "security_groups" {
  type        = list(string)
  description = "List of security groups for the ALB"
}
