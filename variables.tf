variable "admin_cidr" {
  description = "Your public IP address with /32"
  type        = string
}

variable "ami_id" {
  description = "AMI Id for your instances"
  type = string
}

variable "key_name" {
  description = "key pair name for ssh connection"
  type = string
}

