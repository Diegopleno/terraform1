resource "aws_security_group" "acesso" {
    name = "acesso"
    description = "acesso squad dev"
    ingress{
        cidr_blocks = [ "0.0.0.0/0" ]
        ipv6_cidr_blocks = [ "::/0" ]
        from_port = 0
        to_port = 0
        protocol = "-1"
    }
    egress{
        cidr_blocks = [ "0.0.0.0/0" ]
        ipv6_cidr_blocks = [ "::/0" ]
        from_port = 0
        to_port = 0
        protocol = "-1"
    }
    tags = {
        name = "acesso"
    }
}
/*
output "id_securitygroup" {
  value = var.id_grupo_de_segurança
}*/