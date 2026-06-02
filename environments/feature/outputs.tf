output "vpc_id" {

value = module.vpc.vpc_id

}


output "private_subnets" {

value = module.vpc.private_subnets

}


output "public_subnets" {

value = module.vpc.public_subnets

}

output "ecr_repository_url" {

value = module.ecr.repository_url

}
output "cluster_security_group_id" {

  value = module.security_groups.cluster_security_group_id

}


output "node_security_group_id" {

  value = module.security_groups.node_security_group_id

}