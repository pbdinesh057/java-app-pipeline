variable "ami" {
    type    = string
    default = "ami-0c01437c0b055f2c7"
}

variable "instance_type" {
    type    = string
    default = "t2.medium"
}

variable "instance_name" {
    type    = string
    default = "K8-Management-Host"
}

variable "security_group_id" {
    type    = string
    default = "sg-057e80a9d74ea91b8"
}

variable "subnet_id" {
    type    = string
    default = "subnet-0033d0e03ff2e6035"
}

variable "vpc_id" {
    type    = string
    default = "vpc-07aec5c7932798412"
}

variable "bucket_name" {
    type    = string
    default = "k8-config-backend"
}

variable "aws_region" {
    type    = string
    default = "us-east-1"
}

variable "tags" {
    type = string
}

# Add a new variable for the SSH key pair name
# variable "ssh_key_name" {
#     type = string
#     # Provide a default value or make it required, depending on your use case
#     default = "/tmp/all.pem"
# }
variable "key_pair_name" {
  type    = string
  default = "login_key"
}


variable "public_key" {
  type    = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDiWe4LhkSJUF/A0hxIrbq5gzZRP/RRniwYxpDdINMXbvrClyUAQgJpmzsok8v2HVZKpSfmlgKv2ODAHPU/d6trW6zevZO0oQMGhUaPKusY4umzyDvkr2nSE8rV8El8G/3AmkHSItr+yJUMf+3PI3teA/bsw2YrVb28pI0OB0PtK3mBwWgz9lz/ZYIV2q1GyxPvW7uZc7yr+co/db18O4yXaTkaJLS7EdpyiovGyuvTIN0LjqZlQO8nXU4cKVTwVSvpohlYE5gjU+g9W3ryCNIH3eb6QzepePZfg+qlTPBYlw7M52YqD55YTsBBfut3tlPDsDFLGJknBG6P9QGVQpu1 imported-openssh-key"
}
