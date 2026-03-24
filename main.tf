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

  tags = {
    Name = "srv001-terra"
  }
}