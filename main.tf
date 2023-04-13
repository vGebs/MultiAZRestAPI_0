module "vpc" {
  source = "./modules/vpc"
}

module "subnets" {
  source = "./modules/vpc/subnets"
  vpcID  = module.vpc.vpc_ID
}

# Need to assign NACLs to the subnets

resource "aws_route_table" "public" {
  vpc_id = module.vpc.vpc_ID

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = module.vpc.igw_ID
  }

  tags = {
    Name = "Public Route Table"
  }
}

resource "aws_route_table_association" "NAT" {
  subnet_id      = module.subnets.NAT_publicID
  route_table_id = aws_route_table.public.id
}

# need to route load balancer to restAPI

# need to route restAPI to NAT

