resource aws_eks_cluster main {
	name = local.base_identifier
	role_arn = aws_iam_role.main.arn
	
	vpc_config {
		subnet_ids = var.subnet_ids
	}
	
	tags = {
		Name = "${var.name} EKS Cluster"
	}
}