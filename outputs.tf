output identifier {
	description = "EKS cluster identifier."
	value = aws_eks_cluster.main.name
}

output endpoint {
	description = "Kubernetes API endpoint."
	value = aws_eks_cluster.main.endpoint
}