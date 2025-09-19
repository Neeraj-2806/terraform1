module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = "first_cluster"
  cluster_version = "1.32"
  vpc_id          = aws_vpc.first-vpc.id
  subnet_ids      = [aws_subnet.private_subnet.id, aws_subnet.private_subnet2.id]

  enable_irsa = true

  eks_managed_node_groups = {
    node_group = {
      desired_capacity = 2
      max_capacity     = 3
      min_capacity     = 1
      instance_types   = ["t3.micro"]
      key_name         = "first-key"
      node_role_arn    = aws_iam_role.eks_node_group_role.arn
    }
  }
}

