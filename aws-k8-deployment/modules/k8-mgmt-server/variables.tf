variable "ami" {
    type = string
    default  =  "ami-053b0d53c279acc90"
    
}

variable "instance_type" {
     type = string
	 default = "t2.medium"
}

variable "instance_name" {
     type = string
	 default = "K8-Management-Host"
}

variable "security_group_id" {
     type = string
	 default = "sg-057e80a9d74ea91b8"
}

variable "subnet_id" {
     type = string
	 default = "subnet-0033d0e03ff2e6035"
}

variable "vpc_id" {
     type = string
	 default = "vpc-07aec5c7932798412"
}


variable "bucket_name" {
     type = string
	 default = "k8-config-backend"    
}

variable "aws_region" {
     type = string
	 default = "us-east-1"
}
variable "tags" {
  
}

# variable "testsubnet_ids" {
  
# }