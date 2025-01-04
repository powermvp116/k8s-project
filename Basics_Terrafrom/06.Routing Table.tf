# 라우팅 테이블
resource "aws_route_table" "terraform-pub-rt" {
  vpc_id = aws_vpc.terraform-vpc.id

  tags = {
    "Name" = "terraform-pub-rt"
  }
}

resource "aws_route_table" "terraform-pri-rt" {
  vpc_id = aws_vpc.terraform-vpc.id

  tags = {
    "Name" = "terraform-pri-rt"
  }
}

# 라우팅
resource "aws_route" "terraform-pub-rt" {
  route_table_id         = aws_route_table.terraform-pub-rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.terraform-igw.id
}

resource "aws_route" "terraform-pri-rt" {
  route_table_id         = aws_route_table.terraform-pri-rt.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.terraform-ngw.id
}

# 명시적 서브넷 연결
resource "aws_route_table_association" "terraform-pub-rt-associate-2a" {
  subnet_id      = aws_subnet.terraform-pub-subnet-2a.id
  route_table_id = aws_route_table.terraform-pub-rt.id
}

resource "aws_route_table_association" "terraform-pub-rt-associate-2c" {
  subnet_id      = aws_subnet.terraform-pub-subnet-2c.id
  route_table_id = aws_route_table.terraform-pub-rt.id
}

resource "aws_route_table_association" "terraform-pri-rt-associate-2a" {
  subnet_id      = aws_subnet.terraform-pri-subnet-2a.id
  route_table_id = aws_route_table.terraform-pri-rt.id
}

resource "aws_route_table_association" "terraform-pri-rt-associate-2c" {
  subnet_id      = aws_subnet.terraform-pri-subnet-2c.id
  route_table_id = aws_route_table.terraform-pri-rt.id
}