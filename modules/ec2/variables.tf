variable "project_name" {
	description = "Project Name"
	type = string
}

variable "subnet_id" {
	description = "Public subnet ID"
	type = string
}

variable "security_group_id" {
	description = "Security group ID"
	type = string
}

variable "instance_type" {
	description = "EC2 instance type"
	type = string
	default = "t3.micro"
}

variable "key_name" {
	description = "Existing AWS EC2 key pair name"
	type = string
	default = null
}

variable "ami_id" {
	description = "AMI ID for EC2 instance"
	type = string
}

variable "volume_size" {
	description = "Volume size of root block device"
	type = string
	default = 8
}
