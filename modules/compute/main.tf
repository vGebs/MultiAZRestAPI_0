module "sgs" {
  source = "./securitygroups"
}

module "alb" {
  source = "./alb"

  subnets         = var.alb_subnets
  security_groups = [module.sgs.web_sg_id]
}

module "autoscaling" {
  source = "./ec2_autoscaling"

  ami_id             = "ami-0c55b159cbfafe1f0" # Replace with your desired AMI ID
  instance_type      = "t2.micro"
  security_group_ids = [module.sgs.ec2_sg_id]
  subnet_ids         = var.alb_subnets
  desired_capacity   = 2
  min_size           = 2
  max_size           = 15
  environment        = "development"
}
