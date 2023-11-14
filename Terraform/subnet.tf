resource "aws_subnet" "private-subnet-ap-south-1a" {
  vpc_id = aws_vpc.eks_vpc.id
  cidr_block = "10.0.0.0/19"
  availability_zone = "ap-south-1a"
  tags = {
    "Name" = "eks-private-subnet-1"
    "kubernetes.io/cluster/demo" = "owned"
  }
}

resource "aws_subnet" "private-subnet-ap-south-1b" {
  vpc_id = aws_vpc.eks_vpc.id
  cidr_block = "10.0.32.0/19"
  availability_zone = "ap-south-1b"
  tags = {
    "Name" = "eks-private-subnet-2"
    "kubernetes.io/cluster/demo" = "owned"
  }
}

resource "aws_subnet" "public-subnet-ap-south-1a" {
   vpc_id = aws_vpc.eks_vpc.id
   cidr_block = "10.0.64.0/19"
   availability_zone = "ap-south-1a"
   tags = {
    "Name" = "eks-public-subnet-1"
    "kubernetes.io/role/elb" = "1"
    "kubernetes.io/cluster/demo" = "owned"
   } 
}

resource "aws_subnet" "public-subnet-ap-south-1b" {
   vpc_id = aws_vpc.eks_vpc.id
   cidr_block = "10.0.96.0/19"
   availability_zone = "ap-south-1b"
   tags = {
    "Name" = "eks-public-subnet-1"
    "kubernetes.io/role/elb" = "1"
    "kubernetes.io/cluster/demo" = "owned"
   } 
}