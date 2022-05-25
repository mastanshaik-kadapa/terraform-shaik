resource "aws_instance" "web" {
  ami           = lookup(var.ami_id,var.region)
  instance_type = var.instancetype

  tags = {
    Name = "HelloWorld"
  }
}
