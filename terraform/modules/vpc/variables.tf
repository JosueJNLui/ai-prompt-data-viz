variable "vpc_cidr_block" {
  description = "The IPv4 CIDR block for the VPC."
  type        = string
}

variable "public_subnet_cidr_block" {
  description = "The IPv4 CIDR block for the subnet."
  type        = string
}

variable "availability_zone" {
  description = "AZ for the subnet."
  type        = string
}

variable "cidr_blocks_ingress_sg" {
  description = "The IPv4 CIDR blocks allowed in the ingress rule for the EC2 security group."
  type        = list(string)
  default     = []
}
