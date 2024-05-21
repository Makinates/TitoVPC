# This will be all my variables for Public and Private subnets, CIDR and AZ

variable "vpc_cidr" {
  type = string
  description = "Public Subnet CIDR values"
  default = "10.0.0.0/16"
}

variable "public_subnet" {
  type = list(string)
  description = "Public Subnet CIDR values"
  default = [ "10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24" ]
}

# Fetch the List of available AZs
data "aws_availability_zones" "available" {}

variable "private_subnet" {
  type = list(string)
  description = "Private Subnet CIDR values"
  default = [ "10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24" ]
}
