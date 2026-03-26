terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.92"
    }
  }

  required_version = ">= 1.2"
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0007e082d5009529b"
  instance_type = "t2.micro"
  key_name = "dsgomeslab"
  vpc_security_group_ids = ["sg-0dbb42b8aeb1adb7d"]
/*  user_data = <<-EOF
                #!/bin/bash
                cd /home/ubuntu
                echo "<h1>Terraform ansible python</h1>" > index.html
                nohup busybox httpd -f -p 80 &
                  EOF*/
  tags = {
    Name = "Terraform Ansible Python"
  }
}

output "ip_publico" {
  value = aws_instance.app_server.public_ip
  description = "Endereço IP publico"
}

output "id_da_instancia" {
  value = aws_instance.app_server.id
  description = "ID da instancia"
}
