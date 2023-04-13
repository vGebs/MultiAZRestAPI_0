resource "aws_route_table" "app_route" {
  vpc_id = var.vpc_id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = var.nat_gateway_id
  }

  tags = {
    Name = "App server Route"
  }
}

resource "aws_route_table_association" "app_route" {
  subnet_id      = var.private_subnet_id
  route_table_id = aws_route_table.app_route.id
}

resource "aws_route_table" "public" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.internet_gateway_id
  }

  tags = {
    Name = "Public Route Table"
  }
}

resource "aws_route_table_association" "NAT" {
  subnet_id      = var.public_subnet_id
  route_table_id = aws_route_table.public.id
}
