provider "aws" {
  region     = "us-east-1"
  access_key = "AKIATOXWBF25NUSABTWB"
  secret_key = "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"
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
  tags = local.common_tag
}
