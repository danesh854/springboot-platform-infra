resource "aws_eks_cluster" "main" {

  name     = "${var.environment}-eks-cluster"

  role_arn = var.cluster_role_arn


  vpc_config {

    subnet_ids = var.private_subnets

    security_group_ids = [
      var.cluster_security_group_id
    ]

  }


  tags = {

    Name = "${var.environment}-eks-cluster"

    Environment = var.environment

  }

}



resource "aws_eks_node_group" "main" {


  cluster_name = aws_eks_cluster.main.name


  node_group_name = "${var.environment}-nodes"


  node_role_arn = var.node_role_arn


  subnet_ids = var.private_subnets


  instance_types = [

    "t3.medium"

  ]


  scaling_config {

    desired_size = 2

    max_size = 3

    min_size = 1

  }


  depends_on = [

    aws_eks_cluster.main

  ]


  tags = {

    Name = "${var.environment}-eks-node-group"

    Environment = var.environment

  }

}