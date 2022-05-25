variable "ami_id" {
  type = map
  default = {
    "ap-south-1" = "ami-079b5e5b3971bd10d"
  }
}

variable "region" {
  type = string
  default = "ap-south-1"
}

variable "instancetype" {
  type = string
  default = "t2.micro"
}
