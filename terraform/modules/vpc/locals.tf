locals {
  vpc_cidr_block           = var.vpc_cidr_block
  public_subnet_cidr_block = var.public_subnet_cidr_block
  availability_zone        = var.availability_zone
  cidr_blocks_ingress_sg   = var.cidr_blocks_ingress_sg
  project_name             = var.project_name
}
