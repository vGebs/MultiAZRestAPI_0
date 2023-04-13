resource "aws_vpc" "Main" {
  cidr_block = var.cidr_block

  instance_tenancy = var.instance_tenancy

  tags = {
    Name : "Main VPC"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.Main.id
}
