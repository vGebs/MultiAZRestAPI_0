resource "aws_subnet" "loadBalancer_public" {
  vpc_id     = var.vpcID
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "loadBalancer_public"
  }
}

resource "aws_subnet" "restAPI_private" {
  vpc_id     = var.vpcID
  cidr_block = "10.0.2.0/24"
}

resource "aws_subnet" "NAT" {
  vpc_id     = var.vpcID
  cidr_block = "10.0.100.0/28"
}
