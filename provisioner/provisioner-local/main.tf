provider "aws" {
  region     = "us-east-1"
  access_key = ""
  secret_key = ""
}

resource "aws_key_pair" "developer" {
  key_name   = "developer"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDgkgVxPGQN3TPlZ5H3bPg+TlnZ2+96ZMsXCYvM8bmGCqXqaErq6I6EFAS1BkDZwH8oQZAgJu1+xcYriVxPJDwJVTgdGDMkY/KFt7lX2YNZgIW78VcpvbRwlrBvywhvaw10MfGADaw5jW3bo4xCtMqWPeyVsHHbo1kHx/I//B0m9lV3X/8sJJDcmSL3XZK3yzwuZ6onmtTo10FJF7sklTeIl5hiJ/YYZYyrcb9YVm87g0RrRvoM9zL+10YDP991zUwQfTppr2BtO4k/SOKZQECchmBL4hIyFYtrmTfROknp7vIMWOhynj8mz8GP+1Km16jlEAQmPzOrhMsI7S3MXLhD root@ip-192-168-2-47.ec2.internal"
}

variable "privatekey" {
  default = "developer"
}

resource "aws_instance" "web" {
  ami           = "ami-09d3b3274b6c5d4aa"
  instance_type = "t2.micro"
  key_name = "developer"

  tags = {
    Name = "prod"
  }

provisioner "remote-exec" {
  inline = [
    "echo 'build ssh connection' "
 ]
}

connection {
  host = self.public_ip
  user = "ec2-user"
  type = "ssh"
  private_key = file("./developer")
 }
provisioner "local-exec" {
  command = "ansible-playbook -i ${aws_instance.web.public_ip}, --private-key ${var.privatekey} play.yml"
 }
}

