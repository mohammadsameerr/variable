terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.72.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1a"
  acces_key = ""
  secret_key = ""
} 

#Create Instance with docker container and use of variable.
resource "aws_instance" "sam" {
  ami               = var.ami_id
  availability_zone = var.region
  instance_type     = var.instance_type[map]
    "  "
  ]

  tags = {
    Name = "HelloSAm-${count.index}"
  }

#to create docker
user_data = <<EOF
#! /bin/sh
yum update -y
yum install docker -y
service docker start
docker pull nginx:alpine
docker run -it --name my-container -p 80:80 nginx:alpine
EOF
}


# create count meta argument instance.
Vresource "aws_instance" "ec2" {
  count = "var.instance_count"

  ami           = "var.ami_id"
  instance_type = "var.instance_type"

  tags = {
    Name = "ec2-${count.index}"
  }
}
