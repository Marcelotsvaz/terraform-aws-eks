# 
# Naming
#-------------------------------------------------------------------------------
variable prefix {
	description = "Account-wide unique prefix for resource identifiers. E.g., `projectId-envId`."
	type = string
}

variable identifier {
	description = "Used together with prefix to create unique identifiers for resources."
	type = string
	default = "eksCluster"
}

variable name {
	description = "Pretty name for this instance of the module."
	type = string
}


# 
# Network
#-------------------------------------------------------------------------------
variable subnet_ids {
	description = "Name of the function."
	type = set( string )
}



# 
# Locals
#-------------------------------------------------------------------------------
locals {
	base_identifier = "${var.prefix}-${var.identifier}"
	base_iam_path = replace( "/${var.prefix}/", "-", "/" )
}