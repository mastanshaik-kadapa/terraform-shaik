provider "aws" {
  region     = "ap-south-1"
  access_key = ""
  secret_key = ""
}

variable "image" {
 type = list
 default = ["ami-079b5e5b3971bd10d","ami-06a0b4e3b7eb7a300","ami-0756a1c858554433e"]
}

variable "instance" {
  type = map
  default = {
  "dev" = "t2.nano"
  "Test" = "t2.micro"
  "prod" = "t2.micro"
 }
}

variable "input" {
}

resource "aws_instance" "web" {
  ami           = var.image[0]
  instance_type = var.instance["dev"]
  count = var.input == "dev" ? 2 : 0

}
