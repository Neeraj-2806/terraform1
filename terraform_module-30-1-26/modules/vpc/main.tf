resource "aws_vpc" "module-vpc" {
    cidr_block = var.vpc_cidr 
    tags = {
      Name = "${var.env}-vpc"
    }
  
}