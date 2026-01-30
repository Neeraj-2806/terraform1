module "ec2" {
    source = "../modules/ec2"
    instance_type = var.instance_type 
    env = var.environment
}

module "vpc" {
    source = "../modules/vpc"
    vpc_cidr = var.vpc-cidr 
    env = var.environment
}
