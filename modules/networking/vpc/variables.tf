variable "cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "instance_tenancy" {
  description = "A tenancy option for instances launched into the VPC. It can be 'default' (shared hardware) or 'dedicated' (single-tenant hardware). Default is 'default'."
  type        = string
  default     = "default"
}
