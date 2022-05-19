provider "aws" {
  region     = "ap-south-1"
  access_key = ""
  secret_key = ""
}

resource "aws_instance" "cloudera1" {
  ami           = var.image
  instance_type = var.instancetype
  key_name = "devops"

  tags = {
    Name = "HelloWorld"
  }
}

resource "aws_instance" "cloud2" {
  ami           = var.image
  instance_type = var.instancetype
  key_name = "devops"

  tags = {
    Name = "HelloWorld-1"
  }
}
