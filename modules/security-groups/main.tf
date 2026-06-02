# EKS Cluster Security Group

resource "aws_security_group" "eks_cluster_sg" {

  name        = "${var.environment}-eks-cluster-sg"
  description = "Security group for EKS cluster"
  vpc_id      = var.vpc_id


  ingress {
    description = "HTTPS from nodes"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"

    cidr_blocks = [
      var.vpc_cidr
    ]
  }


  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"

    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }


  tags = {
    Name        = "${var.environment}-eks-cluster-sg"
    Environment = var.environment
  }

}



# Worker Nodes Security Group

resource "aws_security_group" "eks_nodes_sg" {

  name        = "${var.environment}-eks-nodes-sg"
  description = "Security group for EKS worker nodes"
  vpc_id      = var.vpc_id


  ingress {
    description = "Node communication"
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"

    self = true
  }


  ingress {
    description = "Cluster communication"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"

    security_groups = [
      aws_security_group.eks_cluster_sg.id
    ]
  }


  egress {

    from_port = 0
    to_port = 0
    protocol = "-1"

    cidr_blocks = [
      "0.0.0.0/0"
    ]

  }


  tags = {

    Name = "${var.environment}-eks-nodes-sg"
    Environment = var.environment

  }

}