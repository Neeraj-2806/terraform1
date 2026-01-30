resource "aws_s3_bucket" "module_s3" {
    bucket =  "${var.s3_bucket_name}-${var.env}-${random_id.bucket_suffix.hex}"  
    tags = {
        Name = "${var.env}-s3"
    }
  
}
resource "random_id" "bucket_suffix" {
  byte_length = 4
}