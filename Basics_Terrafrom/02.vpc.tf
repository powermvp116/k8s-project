resource "aws_vpc" "terraform-vpc" {
  cidr_block           = "10.250.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    "Name" = "terraform-vpc"
  }
}