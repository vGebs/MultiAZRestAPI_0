output "alb_subnet" {
  value = module.subnets.loadBalancer_publicID
}

output "app_subnet" {
  value = module.subnets.restAPI_privateID
}
