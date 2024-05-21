resource "aws_subnet" "Public" {
  count = length(var.public_subnet)
  vpc_id = aws_vpc.vpc-tito
  cidr_block = var.public_subnet[count.index]
  map_public_ip_on_launch = true
  availability_zone = element(data.aws_availability_zones.available.names, count.index)
}

resource "aws_subnet" "Private" {
  count = length(var.private_subnet)
  vpc_id = aws_vpc.vpc-tito
  cidr_block = var.private_subnet[count.index]
  availability_zone = element(data.aws_availability_zones.available.names, count.index)
}