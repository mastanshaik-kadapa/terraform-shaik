provider "aws" {
  region     = "us-east-1"
  access_key = "xxxxxxxxxxx"
  secret_key = ""
}

resource "aws_key_pair" "developer" {
  key_name   = "developer"
  public_key = ""
}

resource "aws_instance" "web" {
  ami           = "ami-09d3b3274b6c5d4aa"
  instance_type = "t2.micro"
  key_name = "developer"

  tags = {
    Name = "prod"
  }

provisioner "file" {
  source="/provisioner/index.html"
  destination="/tmp/index.html"
 }

provisioner "remote-exec" {
  inline = [
    "sudo yum update -y",
    "sudo yum install httpd -y",
    "sudo systemctl start httpd",
    "sudo systemctl enable httpd",
    "sudo cp -r /tmp/index.html /var/www/html",
    "sudo systemctl restart httpd"
 ]
}

connection {
  host = self.public_ip
  user = "ec2-user"
  type = "ssh"
  private_key = file("./developer")
 }
}
