resource "aws_vpc" "this" {
  cidr_block           = local.vpc_cidr_block
  enable_dns_hostnames = true
}

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id
}

resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = local.public_subnet_cidr_block
  availability_zone = local.availability_zone
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.this.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }
}

resource "aws_route_table_association" "public" {
  route_table_id = aws_route_table.public_rt.id
  subnet_id      = aws_subnet.public_subnet.id
}

resource "aws_security_group" "web_sg" {
  name   = "web security group"
  vpc_id = aws_vpc.this.id

  ingress {
    from_port   = "22"
    to_port     = "22"
    protocol    = "tcp"
    cidr_blocks = local.cidr_blocks_ingress_sg
  }

  ingress {
    from_port   = "80"
    to_port     = "80"
    protocol    = "tcp"
    cidr_blocks = local.cidr_blocks_ingress_sg
  }

  ingress {
    from_port   = "8501"
    to_port     = "8501"
    protocol    = "tcp"
    cidr_blocks = local.cidr_blocks_ingress_sg
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
}
