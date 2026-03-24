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
  vpc_security_group_ids = ["sg-0123456789abcdef"]
  user_data = <<-EOF
                #!/bin/bash
                cd /home/ubuntu
                echo "<h1>Feito com Terraform</h1>" > index.html
                nohup busybox httpd -f -p 80 &
                  EOF
  tags = {
    Name = "srv001-terra"
  }
}
