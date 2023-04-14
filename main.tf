module "networking" {
  source = "./modules/networking/"
}

module "compute" {
  source = "./modules/compute"

  alb_subnets = [module.networking.alb_subnet]
  ec2_subnets = [module.networking.app_subnet]
}
