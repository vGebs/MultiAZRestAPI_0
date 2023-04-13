output "app_route_table_id" {
  description = "The ID of the App server Route Table."
  value       = aws_route_table.app_route.id
}

output "public_route_table_id" {
  description = "The ID of the Public Route Table."
  value       = aws_route_table.public.id
}
