resource "null_resource" "sleep" {
  provisioner "local-exec" {
    command     = "Start-Sleep -s 20"
    interpreter = ["PowerShell", "-Command"]
  }
  depends_on = [aws_eks_cluster.eks-cluster]
}

resource "aws_eks_node_group" "Zup-eks-node" {
  cluster_name    = var.cluster_name
  node_group_name = var.eks_node_group_name
  node_role_arn   = aws_iam_role.node.arn
  subnet_ids      = module.vpc.private_subnets
  instance_types  = [var.node-instance-type]


  scaling_config {
    desired_size = var.desired-capacity
    max_size     = var.max-size
    min_size     = var.min-size
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [
    null_resource.sleep,
    aws_iam_role_policy_attachment.node-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.node-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.node-AmazonEC2ContainerRegistryReadOnly,
  ]
}
