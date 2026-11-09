resource "aws_instance" "web" {
	ami = var.ami_id
	instance_type = var.instance_type
	subnet_id = var.subnet_id
	vpc_security_group_ids = [var.security_group_id]
	key_name = var.key_name

	associate_public_ip_address = true

	root_block_device {
	  volume_size = var.volume_size
	  volume_type = "gp3"
	  encrypted = true
	  delete_on_termination = true
        }	

user_data = <<-EOF
#!/bin/bash
sudo apt update
sudo apt upgrade -y
sudo apt install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx

echo "<h1>Terraform AWS Infrastructure Project</h1>" > /var/www/html/index.html
  EOF

tags = {
 Name = "${var.project_name}-web-server"
 Environment = "dev"
}
}
