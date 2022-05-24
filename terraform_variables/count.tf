provider "aws" {
  region     = "ap-south-1"
  access_key = ""
  secret_key = ""
}

variable "image" {
 type = list
 default = ["ami-079b5e5b3971bd10d","ami-06a0b4e3b7eb7a300","ami-0756a1c858554433e"]
}

variable "instancetag" {
  type = list
  default = ["dev","test","prod"]
}

resource "aws_instance" "web" {
  ami           = var.image[count.index]
  instance_type = "t2.micro"
  count = 3

  tags = {
    Name = var.instancetag[count.index]
  }
}
