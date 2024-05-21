# Create AWS VPC in us-east-1
# Set CIDR - 10.0.0.0/16

resource "aws_vpc" "vpc-tito" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "VPC: tito"
  }
}
