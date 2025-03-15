# NETWORKING
resource "aws_vpc" "webapp" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
}

resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.webapp.id
  tags = {
    "Name" = "PROG8830-Week9"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.webapp.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  tags = {
    "Name" = "PROG8830-Week9"
  }
}

resource "aws_subnet" "public_subnet2" {
  vpc_id                  = aws_vpc.webapp.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  tags = {
    "Name" = "PROG8830-Week9"
  }
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.webapp.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags = {
    "Name" = "PROG8830-Week9"
  }
}

resource "aws_route_table_association" "public_subnet_route_table" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_route_table.id
}

