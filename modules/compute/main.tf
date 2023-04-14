module "sgs" {
  source = "./securitygroups"
}

module "alb" {
  source = "./alb"

  subnets         = var.alb_subnets
  security_groups = [module.sgs.web_sg_id]
}
