output "instance-ami" {
  value = aws_instance.web.ami
}

output "instance-type" {
  value = aws_instance.web.instance_type
}

output "vpc_cidr" {
  value = aws_vpc.main.cidr_block
  sensitive = true
}
