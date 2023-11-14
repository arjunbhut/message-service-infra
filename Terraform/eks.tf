resource "aws_iam_role" "sample" {
  name = "eks-cluster-sample"

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

resource "aws_iam_role_policy_attachment" "sample-AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.sample.name
}

resource "aws_eks_cluster" "sample_cluster" {
  name     = "sample_cluster"
  role_arn = aws_iam_role.sample.arn

  vpc_config {
    subnet_ids = [
      aws_subnet.private-subnet-ap-south-1a.id,
      aws_subnet.private-subnet-ap-south-1b.id,
      aws_subnet.public-subnet-ap-south-1a.id,
      aws_subnet.public-subnet-ap-south-1b.id
    ]
  }

  depends_on = [aws_iam_role_policy_attachment.sample-AmazonEKSClusterPolicy]
}