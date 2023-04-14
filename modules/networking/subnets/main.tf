resource "aws_subnet" "loadBalancer_public" {
  vpc_id     = var.vpcID
  cidr_block = "10.0.1.0/24"

  availability_zone = "us-west-2a"

  tags = {
    Name = "loadBalancer_public"
  }
}

resource "aws_subnet" "restAPI_private" {
  vpc_id     = var.vpcID
  cidr_block = "10.0.2.0/24"

  availability_zone = "us-west-2a"
  tags = {
    Name = "restAPI_private_subnet"
  }
}

resource "aws_subnet" "NAT" {
  vpc_id     = var.vpcID
  cidr_block = "10.0.100.0/29"

  availability_zone = "us-west-2a"

  tags = {
    Name = "NAT_gateway_public"
  }
}
