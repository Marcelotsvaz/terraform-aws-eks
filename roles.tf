resource aws_iam_role main {
	path = local.base_iam_path
	name = var.identifier
	description = "Allows the EKS cluster to automatically manage some resources."
	assume_role_policy = data.aws_iam_policy_document.assume_role.json
	managed_policy_arns = [
		"arn:aws:iam::aws:policy/AmazonEKSClusterPolicy",
		"arn:aws:iam::aws:policy/AmazonEKSVPCResourceController",
	]
	
	# inline_policy {
	# 	name = var.prefix
	# 	policy = data.aws_iam_policy_document.role.json
	# }
	
	tags = {
		Name = "${var.name} Role"
	}
}


data aws_iam_policy_document assume_role {
	statement {
		sid = "eksAssumeRole"
		actions = [ "sts:AssumeRole" ]
		principals {
			type = "Service"
			identifiers = [ "eks.amazonaws.com" ]
		}
	}
}


# data aws_iam_policy_document role {
# 	statement {
# 		sid = "dehydratedDnsChallenge"
# 		actions = [
# 			"route53:ChangeResourceRecordSets",
# 			"route53:GetChange",
# 		]
# 		resources = [
# 			"arn:aws:route53:::change/*",
# 		]
# 	}
# }