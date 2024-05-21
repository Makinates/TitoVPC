# This session creates IG, Route Table, NATgw & EIP

resource "aws_internet_gateway" "myGW" {
  vpc_id = aws_vpc.vpc-tito
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc-tito
}

resource "aws_route" "public_route" {
  route_table_id = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.myGW.id
}

resource "aws_route_table_association" "public_a" {
  count = length(var.public_subnet)
  subnet_id = element(aws_subnet.Public[*].id, count.index)
  route_table_id = aws_route.public_route.id
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id = element(aws_subnet.Public[*].id, 0) # To Use the first public subnet for NAT
}

resource "aws_eip" "nat" {
  vpc = true
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.vpc-tito
}

resource "aws_route" "private_route" {
  route_table_id = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id = aws_nat_gateway.nat.id
}

resource "aws_route_table_association" "private_a" {
  count = length(var.private_subnet)
  subnet_id = element(aws_subnet.Private[*].id, count.index)
  route_table_id = aws_route.private_route.id
}