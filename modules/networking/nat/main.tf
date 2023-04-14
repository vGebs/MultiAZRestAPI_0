resource "aws_nat_gateway" "example" {
  allocation_id = aws_eip.nat.id
  subnet_id     = var.subnet_id

  tags = {
    Name = "NAT Gateway"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  # depends_on = [var.igw]
}

resource "aws_eip" "nat" {
  tags = {
    Name = "Elastic IP for nat gateway"
  }
}
