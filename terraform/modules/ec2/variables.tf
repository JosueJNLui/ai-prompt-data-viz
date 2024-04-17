variable "key_name" {
  description = "Key name of the Key Pair to use for the instance."
  type        = string
}

variable "public_key" {
  description = "The public key material."
  type        = string
}

variable "ami" {
  description = "The ami to use for the instance."
  type        = string
}

variable "instance_type" {
  description = "Instance type to use for the instance."
  type        = string
}

variable "subnet_id" {
  description = "VPC Subnet ID to launch in."
  type        = string
}

variable "security_groups_ids" {
  description = "List of security group IDs to associate with."
  type        = list(string)
  default = []
}

variable "instance_name" {
  description = "The name assigned to the EC2 instance"
  type = string
}