/*resource "aws_instance" "first_ec2" {
    ami = "ami-02d26659fd82cf299"
    instance_type = "t3.micro"
    tags = {
        Name = "first_ec2"
    }
  
}
*/

/* resource "aws_instance" "multiple"{
    for_each = var.instances
    ami = "ami-02d26659fd82cf299"
    instance_type = each.value
    tags={
        Name = each.key
    }
    depends_on = ["aws_security_group.first_sg"]
} 
*/ 

/* data "aws_s3_bucket" "bucket"{  # this block will fetch the existing s3 bucket details and can be used for other attributes
    bucket = "neeraj_learning_bucket"

    # for e.g 
      output "bucket arn" {
      value = data.aws_s3_bucket.bucket.arn} # it will print the arn of the bucket neeraj_learning_bucket.
    }*/

/*data "aws_ami" "second" { # aws_ami means fetching the existing ami details and filters ami by name pattern.
    most_recent = true 
    owners = ["amazon"]
    filter {
      name = "name"   # ami is filtered based on the name
        values = ["ubuntu-eks-pro/k8s_1.28/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-20250530"] # in the name block
        #it will fetch the value
    }
  
}*/

/* output "ami_id""second"{
value = data.aws_ami.second.id}
*/