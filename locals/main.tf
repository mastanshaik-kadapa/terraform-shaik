provider "aws" {
  region     = "us-east-1"
  access_key = "AKIABTWB"
  secret_key = "ZNPmOSc/2Ws"
}

locals {
  common_tag = {
    Name = "USA-Project"
    owner = "shaik"
 }
}

resource "aws_instance" "web" {
  ami           = "ami-09d3b3274b6c5d4aa"
  instance_type = "t2.micro"
  tags              = local.common_tag
}

resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  tags              = local.common_tag
}

resource "aws_ebs_volume" "example" {
  availability_zone = "us-east-1a"
  size              = 10
  tags              = local.common_tag
}
