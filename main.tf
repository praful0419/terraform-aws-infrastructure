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
