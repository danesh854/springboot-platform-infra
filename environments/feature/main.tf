module "vpc" {

 source = "../../modules/vpc"


 environment = var.environment


 vpc_cidr = var.vpc_cidr


 public_subnet_cidrs = var.public_subnet_cidrs


 private_subnet_cidrs = var.private_subnet_cidrs


 azs = var.azs

}

module "ecr" {

  source = "../../modules/ecr"


  repository_name = var.repository_name


  environment = var.environment

}
module "security_groups" {

  source = "../../modules/security-groups"

  environment = var.environment

  vpc_id = module.vpc.vpc_id

  vpc_cidr = var.vpc_cidr

}