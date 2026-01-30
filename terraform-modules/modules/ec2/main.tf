resource "aws_instance" "module_ec2" {
    ami = "ami-019715e0d74f695be"
    instance_type = var.instance_type
    tags = {
        Name = "${var.env}-ec2"
    }
  
}