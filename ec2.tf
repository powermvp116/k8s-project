provider "aws" {
  region = "ap-northeast-2"
}

resource "aws_instance" "ec2" {
  ami = "ami-0a5a6128e65676ebb"
  instance_type = "t2.micro"
}

output "ec2_ip" {
    value = aws_instance.ec2.private_ip
}