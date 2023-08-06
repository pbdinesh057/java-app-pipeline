resource "aws_instance" "ec2_instance" {
    ami           = var.ami
    instance_type = var.instance_type
    tags = {
        Name = var.instance_name
    }
    
    # Set the key_name attribute to use the SSH key pair name variable
    key_name = var.ssh_key_name
    provisioner "local-exec" {
    command = "echo Instance with ${aws_instance.ec2_instance.public_ip} ${aws_instance.ec2_instance.private_ip} Created!! >> /tmp/ec2details.txt"
  }
    
    # You can add other configuration settings here as needed
}

resource "aws_s3_bucket" "s3-backend" {
    bucket = var.bucket_name
    #acl    = "private"  # Change this to set the bucket ACL (e.g., "public-read")
    # You can add other configuration settings here as needed, like tags, logging, etc.
}

