# module "k8-mgmt" {
#   source = "./modules/k8-mgmt-server"  # Path to the directory containing the ec2_instance.tf module file
#   #ami               = "ami-0c01437c0b055f2c7"  # Change this to your desired AMI ID for your region
#   instance_type     = "t2.medium"  # Change this to your desired EC2 instance type
#   instance_name     = "K8-Management-Host"  # Change this to your desired instance name
#   vpc_id            = "vpc-07aec5c7932798412"  # Change this to your existing VPC ID
#   subnet_id         = "subnet-0033d0e03ff2e6035"  # Change this to your existing Subnet ID
#   security_group_id = "sg-057e80a9d74ea91b8"  # Add the ID of your existing security group
#   bucket_name = "k8-config-backend"
#   aws_region = "us-east-1"
#   tags = "Testing"
#  # ssh_key_name = "/tmp/all.pem"
# }

#defining the provider block
provider "aws" {
  region = "us-east-1"
	
}


#aws instance creation
resource "aws_instance" "management-server" {
  ami           = "ami-053b0d53c279acc90"
  instance_type = "t2.medium"
  security_groups =  [ "Allow-All" ]
   key_name = "all"
  tags = {
    Name = "Kube-mgmt-node"
  }
}


#IP of aws instance retrieved
output "op1"{
value = aws_instance.management-server.public_ip
}

output "op2"{
value = aws_instance.management-server.private_ip
}


#IP of aws instance copied to a file ip.txt in local system
resource "local_file" "ip" {
    content  = aws_instance.management-server.public_ip
    filename = "public-ip.txt"
}


#ebs volume created
resource "aws_ebs_volume" "ebs"{
  availability_zone =  aws_instance.management-server.availability_zone
  size              = 1
  tags = {
    Name = "myterraebs"
  }
}


#ebs volume attatched
resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.ebs.id
  instance_id = aws_instance.management-server.id
  force_detach = true
}


#device name of ebs volume retrieved
output "op2"{
value = aws_volume_attachment.ebs_att.device_name
}

