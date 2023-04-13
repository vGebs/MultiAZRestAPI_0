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

# resource "aws_route_table" "app_route" {
#   vpc_id = module.vpc.vpc_ID

#   route {
#     cidr_block     = "0.0.0.0/0"
#     nat_gateway_id = module.subnets.NAT_publicID
#   }

#   tags = {
#     Name = "App server Route"
#   }
# }

# resource "aws_route_table_association" "app_route" {
#   subnet_id      = module.subnets.restAPI_privateID
#   route_table_id = aws_route_table.app_route.id
# }

# resource "aws_route_table" "public" {
#   vpc_id = module.vpc.vpc_ID

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = module.vpc.igw_ID
#   }

#   tags = {
#     Name = "Public Route Table"
#   }
# }

# resource "aws_route_table_association" "NAT" {
#   subnet_id      = module.subnets.NAT_publicID
#   route_table_id = aws_route_table.public.id
# }
