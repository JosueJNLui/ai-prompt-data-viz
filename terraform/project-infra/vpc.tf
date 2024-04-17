module "vpc" {
  source = "../modules/vpc"

  vpc_cidr_block           = local.vpc_cidr_block
  public_subnet_cidr_block = local.public_subnet_cidr_block
  availability_zone        = local.availability_zone
  cidr_blocks_ingress_sg   = local.cidr_blocks_ingress_sg
  project_name             = local.project_name
}
