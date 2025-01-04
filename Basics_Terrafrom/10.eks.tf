# EKS Cluster IAM Role 생성
resource "aws_iam_role" "terraform-eks-cluster-role" {
  name = "terraform-eks-cluster-role"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

# IAM Role에 정책 부착
resource "aws_iam_role_policy_attachment" "terraform-eks-cluster-AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.terraform-eks-cluster-role.name
}

resource "aws_iam_role_policy_attachment" "terraform-eks-cluster-AmazonEKSVPCResourceController" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
  role       = aws_iam_role.terraform-eks-cluster-role.name
}

# EKS Cluster 생성
resource "aws_eks_cluster" "terraform-eks-cluster" {
  name     = "terraform-eks-cluster"
  role_arn = aws_iam_role.terraform-eks-cluster-role.arn

  vpc_config {
    subnet_ids              = [aws_subnet.terraform-pri-subnet-2a.id, aws_subnet.terraform-pri-subnet-2c.id]
    endpoint_public_access  = true
    endpoint_private_access = false
    security_group_ids      = [aws_security_group.terraform-sg-eks-node-group.id]
  }

  # 의존성
  depends_on = [
    aws_iam_role_policy_attachment.terraform-eks-cluster-AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.terraform-eks-cluster-AmazonEKSVPCResourceController,
  ]
}