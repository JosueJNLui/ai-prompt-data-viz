locals {
  env          = var.env
  aws_region   = var.aws_region
  aws_profile  = var.aws_profile
  project_name = var.project_name

  key_name            = "kp"
  public_key          = "./kp.pub"
  ami                 = "ami-0f5daaa3a7fb3378b"
  instance_type       = "t2.micro"
  subnet_id           = module.vpc.public_subnet_id
  security_groups_ids = [module.vpc.security_groups_ids]

  vpc_cidr_block           = "10.0.0.0/16"
  public_subnet_cidr_block = "10.0.1.0/24"
  availability_zone        = "us-east-2a"
  cidr_blocks_ingress_sg   = ["0.0.0.0/0"] #It was used private ipv4 address as the sake of the project
}
