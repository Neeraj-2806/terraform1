module "vpc" {
    source = "../modules/vpc"
    vpc_cidr = var.vpc-cidr 
    env = var.environment
}

module "ec2" {
    source = "../modules/ec2"
    instance_type = var.instance_type
    env = var.environment
}
module "s3"{
    source = "../modules/S3" 
    s3_bucket_name = var.s3_bucket_name
    env = var.environment
}