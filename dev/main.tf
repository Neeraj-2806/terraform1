module "vpc" {
    source = "../modules/vpc"
    vpc_cidr = var.vpc_cidr
    env = var.env
  
}
module "ec2" {
  source        = "../modules/ec2"
  instance_type = var.instance_type
  env           = var.env
}
