resource "aws_instance" "sam" {
  ami               = var.ami_id
  availability_zone = var.region
  instance_type     = var.instance_type
  
  subnet_id                   = aws_subnet.sam_open_subnet.id
  vpc_security_group_ids      = [aws_security_group.web_sg.id]

  tags = {
    Name = "HelloSAm"
  }
}

#create public subnet
resource "aws_subnet" "sam_open_subnet" {
  vpc_id            = aws_vpc.sam_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-south-1a"

  tags = {
    Name = "Sam.open.Subnet"
  }
}

#create security group
resource "aws_security_group" "web_sg" {
  name   = "HTTP and SSH"
  vpc_id = aws_vpc.sam_vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}

#create vpc
resource "aws_vpc" "sam_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "sam_VPC"
  }
}

#create internet gateway
resource "aws_internet_gateway" "sam-gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "sammeer"
  }
}

#applying depends on.
resource "aws_eip" "sameip" {
  instance = aws_instance.sam.id
  vpc      = true
  depends_on = [
    aws_internet_gateway.sam-gw
  ]
}