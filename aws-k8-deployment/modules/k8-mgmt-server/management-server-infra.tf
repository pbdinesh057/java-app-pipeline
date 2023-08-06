resource "aws_instance" "ec2_instance" {
  ami           = var.ami
  instance_type = var.instance_type
  tags = {
    Name = var.instance_name
  }
  
  vpc_security_group_ids  = [var.security_group_id]
  subnet_id               = var.subnet_id
  vpc_id                  = var.vpc_id
  
  # You can add other configuration settings here as needed
}


resource "aws_s3_bucket" "s3-backend" {
  bucket = var.bucket_name
  #acl    = "private"  # Change this to set the bucket ACL (e.g., "public-read")
  region = var.aws_region

  # You can add other configuration settings here as needed, like tags, logging, etc.
}