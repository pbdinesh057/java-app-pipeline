module "k8-mgmt" {
  source = "./modules/k8-mgmt-server"  # Path to the directory containing the ec2_instance.tf module file
  ami               = "ami-0c01437c0b055f2c7"  # Change this to your desired AMI ID for your region
  instance_type     = "t2.medium"  # Change this to your desired EC2 instance type
  instance_name     = "K8-Management-Host"  # Change this to your desired instance name
  vpc_id            = "vpc-07aec5c7932798412"  # Change this to your existing VPC ID
  subnet_id         = "subnet-0033d0e03ff2e6035"  # Change this to your existing Subnet ID
  security_group_id = "sg-057e80a9d74ea91b8"  # Add the ID of your existing security group
  bucket_name = "k8-config-backend"
  aws_region = "us-east-1"
  tags = "Testing"
  ssh_key_name = "all"
}

output "ec2_instance_id" {
    value = aws_instance.ec2_instance.id
}

output "ec2_instance_public_ip" {
    value = aws_instance.ec2_instance.public_ip
}

output "ec2_instance_public_dns" {
    value = aws_instance.ec2_instance.public_dns
}

output "ec2_instance_private_ip" {
    value = aws_instance.ec2_instance.private_ip
}

output "s3" {
    value = aws_s3_bucket.s3-backend.bucket
}


