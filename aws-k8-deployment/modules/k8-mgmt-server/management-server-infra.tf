resource "aws_instance" "ec2_instance" {
  ami           = var.ami
  instance_type = var.instance_type
  tags = {
    Name = var.instance_name
  }
  # You can add other configuration settings here as needed
}


resource "aws_s3_bucket" "s3-backend" {
  bucket = var.bucket_name
  #acl    = "private"  # Change this to set the bucket ACL (e.g., "public-read")
  region = var.aws_region

  # You can add other configuration settings here as needed, like tags, logging, etc.
}