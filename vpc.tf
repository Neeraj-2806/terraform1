resource "aws_vpc" "first-vpc" {
    cidr_block = var.cidr_block
    enable_dns_support = true 
    enable_dns_hostnames = true
    tags = {
        Name = "first-vpc"
    }
  
}
resource "aws_subnet" "public_subnet" {
    vpc_id = aws_vpc.first-vpc.id
    map_public_ip_on_launch = true
    availability_zone = "ap-south-1a"
    cidr_block = var.public_subnet_cidr  
    tags = {
        Name = "public-subnet1"
    }
}
resource "aws_subnet" "private_subnet" {
    vpc_id = aws_vpc.first-vpc.id
    map_public_ip_on_launch = false 
    availability_zone = "ap-south-1a"
    cidr_block = var.private_subnet_cidr
    tags = {
        Name = "private-subnet1"
    }  
}
resource "aws_subnet" "public_subnet2" {
    vpc_id = aws_vpc.first-vpc.id
    map_public_ip_on_launch = true
    availability_zone = "ap-south-1b"
    cidr_block = var.public_subnet_cidr2  
    tags = {
        Name = "public-subnet2"
    }
}
resource "aws_subnet" "private_subnet2" {
    vpc_id = aws_vpc.first-vpc.id
    map_public_ip_on_launch = false 
    availability_zone = "ap-south-1b"
    cidr_block = var.private_subnet_cidr2  
    tags = {
        Name = "private-subnet2"
    }
}


resource "aws_internet_gateway" "igw"{
    vpc_id = aws_vpc.first-vpc.id 
    tags = {
        Name = "first-igw"
    }
}
resource "aws_route_table" "public" {
    vpc_id = aws_vpc.first-vpc.id
    tags = {
      Name = "public_route_table"
    }
}
resource "aws_route_table" "private" {
    vpc_id = aws_vpc.first-vpc.id 
    tags = {
        Name = "private_route_table"
    } 
}
resource "aws_route_table_association" "public_subnet_ass" {
    subnet_id = aws_subnet.public_subnet.id 
    route_table_id = aws_route_table.public.id
}
resource "aws_route_table_association" "private_subnet_ass" {
    subnet_id = aws_subnet.private_subnet.id 
    route_table_id = aws_route_table.private.id
}
resource "aws_route" "public_route" {
    route_table_id = aws_route_table.public.id 
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
}
resource "aws_eip" "elastic_ip" {
    depends_on = [ aws_internet_gateway.igw ]
    tags = {
      Name = "nat_eip"
    }
}
resource "aws_nat_gateway" "nat" {
    allocation_id = aws_eip.elastic_ip.id
    subnet_id = aws_subnet.public_subnet.id
    tags = {
        Name = "nat_gateway"
    }
}
resource "aws_route" "private_route_table"{
    route_table_id = aws_route_table.private.id
    destination_cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
}