variable "cidr_block" {
    type = string
    default = "10.0.0.0/16"
  
}

variable public_subnet_cidr {
    type = string 
    default = "10.0.0.0/24"
}
variable private_subnet_cidr {
    type = string 
    default = "10.0.1.0/24"
}

variable public_subnet_cidr2 {
    type = string 
    default = "10.0.2.0/24"
}
variable private_subnet_cidr2 {
    type = string 
    default = "10.0.3.0/24"
}
variable "private_subnet_ids"{
    type = list(string)
}
variable "vpc_id" {
}
variable "db_user" {
}
variable "db_password" {
}
variable "db_name" {
}