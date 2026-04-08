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
  region = var.regiao_aws
}

resource "aws_instance" "app_server" {
  ami           = "ami-0007e082d5009529b"
  instance_type = var.instancia
  key_name = var.ssh_key
  /*vpc_security_group_ids = ["sg-0dbb42b8aeb1adb7d"]*/
  tags = {
    Name = "Instância EC2"
  }
}

resource "aws_key_pair" "ChaveSSH" {
  key_name = var.ssh_key
  public_key = file("${var.ssh_key}.pub")
}


/////*---------------------------------*/
/////*---------------------------------*/

output "ip_publico" {
/*  value = aws_instance.app_server.public_ip*/
    value = var.ip_publico
  description = "Endereço IP publico"
}

output "id_da_instancia" {
  value = var.id_da_instancia
  description = "ID da instancia"
}

/*output "id_da_instancia" {
  value = aws_instance.app_server.id
  description = "ID da instancia"
}*/


/*output "id_securitygroup" {
  value = var.id_grupo_de_segurança
}*/