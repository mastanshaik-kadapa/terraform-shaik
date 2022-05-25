data "aws_security_group" "sg" {
  filter {
    name  = "group-name"
    values= ["ec2group123"]
  }
}

resource "aws_instance" "web" {
  ami           = lookup(var.ami_id,var.region)
  instance_type = var.instancetype
  vpc_security_group_ids = [data.aws_security_group.sg.id]
  count = 2
  key_name = "india"
  tags = {
    Name = "HelloWorld"
  }
}
