provider "aws" {
  region = "ap-south-1"
}

module "vpc" {
  source      = "./modules/vpc"
  vpc_cidr    = "10.0.0.0/16"
  subnet_cidr = "10.0.1.0/24"
}

module "ec2" {
  source = "./modules/ec2"

  vpc_id    = module.vpc.vpc_id
  subnet_id = module.vpc.subnet_id

  ami           = "ami-0f5ee92e2d63afc18"
  instance_type = "t2.micro"

  user_image     = "<dockerhub>/user-service"
  product_image  = "<dockerhub>/product-service"
  order_image    = "<dockerhub>/order-service"
  cart_image     = "<dockerhub>/cart-service"
  frontend_image = "<dockerhub>/frontend"
}