data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]  # Official AWS accoount ID of canonical company that publishes ubuntu 
  # AMI on aws.

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}