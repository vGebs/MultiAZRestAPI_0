variable "your_ip_address" {
  description = "Your IP address so you access the ec2 instances for ssh"
  type        = string
  default     = "0.0.0.0/0"
}
