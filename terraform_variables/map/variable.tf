variable "ami_id" {
  type = map
  default = {
    "us-east-1" = "ami-0022f774911c1d690"
    "ap-south-1" = "ami-079b5e5b3971bd10d"
  }
}

variable "region" {
  type = string
}

variable "instancetype" {
  type = string
  default = "t2.micro"
}

