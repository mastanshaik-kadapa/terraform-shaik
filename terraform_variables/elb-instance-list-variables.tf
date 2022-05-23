provider "aws" {
  region     = "ap-south-1"
  access_key = ""
  secret_key = ""
}

variable "elbname" {
  type = string
}

variable "azname" {
  type = list
  default = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
}

variable "timeout" {
  type = number
}

resource "aws_elb" "bar" {
  name               = var.elbname
  availability_zones = var.azname

  listener {
    instance_port     = 8000
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }
    health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:8000/"
    interval            = 30
  }

  cross_zone_load_balancing   = true
  idle_timeout                = var.timeout
  connection_draining         = true
  connection_draining_timeout = var.timeout

  tags = {
    Name = "mycloudelb"
  }
}

variable "instancetype" {
  type = list
  default = ["t2.micro","t2.micro","t2.micro"]
}

variable  "image" {
    default = "ami-079b5e5b3971bd10d"
}

variable "instancetag" {
  type = list
  default = ["DEV-DEPT","TEST-DEPT","PROD-DEPT"]
}

resource "aws_instance" "dev" {
  ami           = var.image
  instance_type = var.instancetype[0]
  key_name = "devops"

  tags = {
    Name = var.instancetag[0]
  }
}

resource "aws_instance" "test" {
  ami           = var.image
  instance_type = var.instancetype[1]
  key_name = "devops"

  tags = {
    Name = var.instancetag[1]
  }
}

resource "aws_instance" "prod" {
  ami           = var.image
  instance_type = var.instancetype[2]
  key_name = "devops"

  tags = {
    Name = var.instancetag[2]
  }
}
