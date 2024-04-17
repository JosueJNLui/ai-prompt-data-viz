module "ec2" {
  source = "../modules/ec2"

  key_name            = local.key_name
  public_key          = local.public_key
  ami                 = local.ami
  instance_type       = local.instance_type
  subnet_id           = local.subnet_id
  security_groups_ids = local.security_groups_ids
  instance_name       = local.instance_name
}
