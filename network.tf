# NETWORKING
module "vpc" {
  source   = "./modules/vpc"
  vpc_cidr = cidrsubnet("10.1.2.0/24", 4, 15)
}


resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = module.vpc.vpc_id
  tags = {
    "Name" = "PROG8830-Week10"
  }
}

resource "aws_subnet" "public_subnet_1" {
  vpc_id                  = module.vpc.vpc_id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = true
  tags = {
    "Name" = "PROG8830-Week10"
  }
}


resource "aws_subnet" "public_subnet_2" {
  vpc_id                  = module.vpc.vpc_id
  cidr_block              = "10.0.3.0/24"
  map_public_ip_on_launch = true
  tags = {
    "Name" = "PROG8830-Week10"
  }
}

resource "aws_route_table" "public_route_table" {
  vpc_id = module.vpc.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags = {
    "Name" = "PROG8830-Week10"
  }
}

resource "aws_route_table_association" "public_subnet_1_route_table" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "public_subnet_2_route_table" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_db_subnet_group" "public_subnet_group" {
  name       = "public_subnet_group"
  subnet_ids = [aws_subnet.public_subnet_1.id, aws_subnet.public_subnet_2.id]
}

resource "aws_db_parameter_group" "parameter_group" {
  name   = "pg"
  family = "postgres16"

  parameter {
    name  = "log_connections"
    value = 1
  }
}