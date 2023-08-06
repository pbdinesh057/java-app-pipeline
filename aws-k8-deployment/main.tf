module "k8-mgmt" {
  source = "./modules/k8-mgmt-server"  # Path to the directory containing the ec2_instance.tf module file
  ami               = "ami-0c55b159cbfafe1f0"  # Change this to your desired AMI ID for your region
  instance_type     = "t2.medium"  # Change this to your desired EC2 instance type
  instance_name     = "K8-Management-Host"  # Change this to your desired instance name
  vpc_id            = "vpc-07aec5c7932798412"  # Change this to your existing VPC ID
  subnet_id         = "subnet-0033d0e03ff2e6035"  # Change this to your existing Subnet ID
  security_group_id = "sg-057e80a9d74ea91b8"  # Add the ID of your existing security group
  bucket_name = "k8-config-backend"
  aws_region = "us-east-1"
}
