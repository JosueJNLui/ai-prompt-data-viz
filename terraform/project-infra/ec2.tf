module "ec2" {
  source = "../modules/ec2"

  key_name            = local.key_name
  public_key          = local.public_key
  ami                 = local.ami
  instance_type       = local.instance_type
  subnet_id           = local.subnet_id
  security_groups_ids = local.security_groups_ids
  instance_name       = local.instance_name
  user_data = <<-EOF
  #!/bin/bash

  # Creating the main directory
  mkdir ${local.project_name}

  # Set Docker's apt repository

  # Add Docker's official GPG key:
  sudo apt-get update
  sudo apt-get install ca-certificates curl
  sudo install -m 0755 -d /etc/apt/keyrings
  sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
  sudo chmod a+r /etc/apt/keyrings/docker.asc

  # Add the repository to Apt sources:
  echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
    $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  sudo apt-get update

  # Instlal the latest version
  sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

  # Installing the docker compose
  sudo apt install -y docker-compose
EOF
}
