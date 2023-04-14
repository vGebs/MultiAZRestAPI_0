output "web_sg_id" {
  description = "The ID of the web security group"
  value       = aws_security_group.web_sg.id
}

output "ec2_sg" {
  description = "The ID of the ec2 security group"
  value       = aws_security_group.ec2_sg.id
}
