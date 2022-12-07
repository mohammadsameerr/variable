#use of variable
variable "ami_id" {
  default = "ami-21f78e11"
}

#variable type as Number
variable "instance_type" {
  default = number
}

#variable type as String
variable "instance_type" {
  default = string
}

#variable type as List
variable "instance_type" {
  type = list(string)
  default = ["t2.micro","t2.medium","t2.large"]
}

#Variable type as Map
variable "instance_type" {
  type = map(string)
  default = {
    "dev" = "t2.micro"
    "qa" = "t2.medium"
    "uat" = "t2.large"   
  }
}

variable "region" {
  default = "ap-south-1a"
}

variable "aws-instance-count" {
  default = 1
}

