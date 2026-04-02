resource "aws_security_group" "sg" {
  vpc_id = var.vpc_id

  ingress {
    from_port   = 3000
    to_port     = 3004
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "app" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  vpc_security_group_ids = [aws_security_group.sg.id]

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install -y docker.io
              systemctl start docker
              systemctl enable docker

              docker run -d -p 3001:3001 ${var.user_image}
              docker run -d -p 3002:3002 ${var.product_image}
              docker run -d -p 3003:3003 ${var.order_image}
              docker run -d -p 3004:3004 ${var.cart_image}
              docker run -d -p 3000:3000 ${var.frontend_image}
              EOF

  tags = {
    Name = "ecommerce-app"
  }
}