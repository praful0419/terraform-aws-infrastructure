module "vpc" {
  source = "./modules/vpc"

  project_name = "terraform-lab"
  vpc_cidr     = "10.0.0.0/16"
}

module "security_group" {
  source       = "./modules/security-group"
  project_name = "terraform-lab"
  vpc_id       = module.vpc.vpc_id

  ingress_rules = [
    {
      description = "SSH access"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = [var.admin_cidr]
    },
    {
      description = "HTTP acess"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}

module "ec2" {
  source = "./modules/ec2"
  project_name = "terraform-lab"
  subnet_id = module.vpc.public_subnet_id
  security_group_id = module.security_group.security_group_id
  ami_id = var.ami_id
  key_name = var.key_name 
}
