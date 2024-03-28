resource "aws_key_pair" "kp" {
  key_name   = local.key_name
  public_key = file("${local.public_key}")
}

resource "aws_instance" "this" {
  ami                    = local.ami
  instance_type          = local.instance_type
  subnet_id              = local.subnet_id
  key_name               = aws_key_pair.kp.key_name
  vpc_security_group_ids = local.security_groups_ids
}

resource "aws_eip" "web_eip" {
  instance = aws_instance.this.id
}
