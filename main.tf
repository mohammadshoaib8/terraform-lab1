provider "aws" {
  region = "ap-southeast-1" # Change as needed
}

module "vpc" {
  source            = "./modules/vpc"
  cidr_block        = var.cidr_block
  name              = var.name
  availability_zone = var.availability_zone
}

module "ec2" {
  source        = "./modules/ec2"
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = module.vpc.public_subnet_id
  vpc_id        = module.vpc.vpc_id
}