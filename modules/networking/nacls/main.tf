resource "aws_network_acl" "lb" {
  vpc_id = var.vpc_id

  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 80
    to_port    = 80
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 110
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 443
    to_port    = 443
  }

  egress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = var.private_subnet_cidr
    from_port  = 3000
    to_port    = 3000
  }

  tags = {
    Name = "Load balancer Subnet ACL"
  }
}

resource "aws_network_acl_association" "lb" {
  subnet_id      = var.lb_public_subnet_id
  network_acl_id = aws_network_acl.lb.id
}

resource "aws_network_acl" "app" {
  vpc_id = var.vpc_id

  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = var.public_lb_subnet_cidr
    from_port  = 3000
    to_port    = 3000
  }

  egress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 65535
  }

  tags = {
    Name = "Private app server subnet NACL"
  }
}

resource "aws_network_acl_association" "app" {
  subnet_id      = var.app_private_subnet_id
  network_acl_id = aws_network_acl.app.id
}

resource "aws_network_acl" "nat_gateway_subnet_acl" {
  vpc_id = var.vpc_id

  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = var.private_subnet_cidr
    from_port  = 0
    to_port    = 65535
  }

  egress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 65535
  }

  tags = {
    Name = "NAT Gateway Subnet ACL"
  }
}

resource "aws_network_acl_association" "nat_gateway_public_subnet_association" {
  subnet_id      = var.nat_gateway_public_subnet_id
  network_acl_id = aws_network_acl.nat_gateway_subnet_acl.id
}
