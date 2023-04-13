output "loadBalancer_publicID" {
  description = "The load balancer public subnet ID"
  value       = aws_subnet.loadBalancer_public.id
}

output "restAPI_privateID" {
  description = "The rest api private subnet ID"
  value       = aws_subnet.restAPI_private.id
}

output "NAT_publicID" {
  description = "The public NAT subnet ID"
  value       = aws_subnet.NAT.id
}
