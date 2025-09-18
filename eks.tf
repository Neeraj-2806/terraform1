module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "~> 20.0"  # Added module version
  cluster_name    = "first_cluster"
  cluster_version = "1.32"
  vpc_id          = aws_vpc.first-vpc.id
  subnet_ids      = [
    aws_subnet.private_subnet.id,
    aws_subnet.private_subnet2.id
  enable_irsa = true

  # Cluster-level tags
  tags = {
    Name = "first-cluster"
  }

  # Defaults for all managed node groups
  eks_managed_node_group_defaults = {
    ami_type               = "CUSTOM"
    vpc_security_group_ids = [aws_security_group.first_sg.id]
  }

  # Managed node groups
  eks_managed_node_groups = {
    node_group = {
      desired_capacity = 2
      max_capacity     = 3
      min_capacity     = 1
      instance_types   = ["t3.micro"]
      key_name         = "first-key"
      ami_id           = data.aws_ami.ubuntu.id
      tags = {
        Name = "eks-nodes"
      }
    }
  }
}
