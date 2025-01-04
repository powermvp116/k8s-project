# 탄력적 IP
resource "aws_eip" "terraform-eip" {
  domain = "vpc"
}

# NAT 게이트웨이
resource "aws_nat_gateway" "terraform-ngw" {
  allocation_id = aws_eip.terraform-eip.id
  subnet_id     = aws_subnet.terraform-pub-subnet-2a.id
  tags = {
    "Name" = "terraform-ngw"
  }
}