locals {
  key_name            = var.key_name
  public_key          = var.public_key
  ami                 = var.ami
  instance_type       = var.instance_type
  subnet_id           = var.subnet_id
  security_groups_ids = var.security_groups_ids
  instance_name       = var.instance_name
  user_data           = var.user_data
}
