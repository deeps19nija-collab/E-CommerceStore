resource "aws_security_group" "allow_tls_ipv4" {
  name        = "allow_tls_module"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = var.vpc_id
  tags = {
    Name = "allow_tls"
  } 
}

resource "aws_vpc_security_group_ingress_rule" "allow_inbound_ipv4" {
  security_group_id = aws_security_group.allow_tls_ipv4.id
  cidr_ipv4         = var.source_ip
  from_port         = var.allow_inbound_port
  ip_protocol       = "tcp"
  to_port           = var.allow_inbound_port
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.allow_tls_ipv4.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}
