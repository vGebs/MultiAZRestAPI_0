variable "alb_subnets" {
  type        = list(string)
  description = "List of subnets for the ALB"
}

variable "ec2_subnets" {
  type        = list(string)
  description = "List of subnets for ec2s"
}
