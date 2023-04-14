module "vpc" {
  source = "./vpc"
}

module "subnets" {
  source = "./subnets"
  vpcID  = module.vpc.vpc_ID
}

module "route_tables" {
  source              = "./route_tables"
  vpc_id              = module.vpc.vpc_ID
  nat_gateway_id      = module.subnets.NAT_publicID
  internet_gateway_id = module.vpc.igw_ID
  private_subnet_id   = module.subnets.restAPI_privateID
  public_subnet_id    = module.subnets.NAT_publicID
}

# we need to ad NACLs to each subnet now
module "nacls" {
  source = "./nacls"

  vpc_id                       = module.vpc.vpc_ID
  private_subnet_cidr          = module.subnets.restAPI_private_cidr
  public_lb_subnet_cidr        = module.subnets.loadBalancer_subnet_cidr
  lb_public_subnet_id          = module.subnets.loadBalancer_publicID
  app_private_subnet_id        = module.subnets.restAPI_privateID
  nat_gateway_public_subnet_id = module.subnets.NAT_publicID
}
