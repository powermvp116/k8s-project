# Public Subnet
resource "aws_subnet" "terraform-pub-subnet-2a" {
  vpc_id                  = aws_vpc.terraform-vpc.id
  cidr_block              = "10.250.1.0/24"
  availability_zone       = "ap-northeast-2a"
  map_public_ip_on_launch = "true"
  tags = {
    "Name"                              = "terraform-pub-subnet-2a"
    "kubernetes.io/role/elb"            = "1"
    "kubernetes.io/cluster/terraform-eks-cluster" = "shared"
  }
}

resource "aws_subnet" "terraform-pub-subnet-2c" {
  vpc_id                  = aws_vpc.terraform-vpc.id
  cidr_block              = "10.250.2.0/24"
  availability_zone       = "ap-northeast-2c"
  map_public_ip_on_launch = "true"
  tags = {
    "Name"                              = "terraform-pub-subnet-2c"
    "kubernetes.io/role/elb"            = "1"
    "kubernetes.io/cluster/terraform-eks-cluster" = "shared"
  }
}

# Private Subnet
resource "aws_subnet" "terraform-pri-subnet-2a" {
  vpc_id            = aws_vpc.terraform-vpc.id
  cidr_block        = "10.250.11.0/24"
  availability_zone = "ap-northeast-2a"
  tags = {
    "Name"                              = "terraform-pri-subnet-2a"
    "kubernetes.io/role/internal-elb"   = "1"
    "kubernetes.io/cluster/terraform-eks-cluster" = "shared"
  }
}

resource "aws_subnet" "terraform-pri-subnet-2c" {
  vpc_id            = aws_vpc.terraform-vpc.id
  cidr_block        = "10.250.12.0/24"
  availability_zone = "ap-northeast-2c"
  tags = {
    "Name"                              = "terraform-pri-subnet-2c"
    "kubernetes.io/role/internal-elb"   = "1"
    "kubernetes.io/cluster/terraform-eks-cluster" = "shared"
  }
}