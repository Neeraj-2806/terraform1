resource "aws_instance" "first_ec2" {
    ami = "ami-02d26659fd82cf299"
    instance_type = "t3.micro"
    key_name = aws_key_pair.first_key.key_name
    subnet_id = aws_subnet.public_subnet.id # aws ec2 resource does not take vpc id, it only takes subnet id.
    vpc_security_group_ids = [aws_security_group.first_sg.id]  
    root_block_device {
      volume_size = 30
      volume_type = "gp3"
    }
    tags = {
        Name = "first_machine-${terraform.workspace}"
    }
}

resource "aws_security_group" "first_sg" {
    name = "first_sg-${terraform.workspace}"
    vpc_id = aws_vpc.first-vpc.id

  dynamic "ingress" {  #dynamic blockis use to create multiple ingress rules based on var.ingress_ports.
    for_each = var.ingress_ports
    content{
        from_port = ingress.value # current port number taken from var.ingress_ports and it will take ports one by one
        to_port = ingress.value
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
  }
  egress {
    from_port = 0
    to_port = 0 
    protocol = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "tls_private_key" "first" {
    algorithm = "RSA"
    rsa_bits = 4096
}
resource "aws_key_pair" "first_key" {
    key_name = "first_key"
    public_key = tls_private_key.first.public_key_openssh
  
}
