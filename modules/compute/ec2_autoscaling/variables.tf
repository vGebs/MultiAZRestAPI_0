variable "ami_id" {
  type        = string
  description = "The Amazon Machine Image (AMI) ID to be used for the instances."
}

variable "instance_type" {
  type        = string
  description = "The instance type to be used for the instances."
}

variable "security_group_ids" {
  type        = list(string)
  description = "A list of security group IDs to associate with the instances."
}

variable "subnet_ids" {
  type        = list(string)
  description = "A list of subnet IDs where the instances will be launched."
}

variable "desired_capacity" {
  type        = number
  description = "The number of instances that the Auto Scaling group attempts to maintain."
}

variable "min_size" {
  type        = number
  description = "The minimum number of instances allowed in the Auto Scaling group."
}

variable "max_size" {
  type        = number
  description = "The maximum number of instances allowed in the Auto Scaling group."
}

variable "environment" {
  type        = string
  description = "An identifier for the environment, such as 'production' or 'staging'. This is typically used for tagging purposes."
}
