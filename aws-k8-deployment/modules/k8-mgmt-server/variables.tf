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
  default = "-----BEGIN PUBLIC KEY-----
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA4lnuC4ZEiVBfwNIcSK26
uYM2UT/0UZ4sGMaQ3SDTF276wpclAEICaZs7KJPL9h1WSqUn5pYCr9jgwBz1P3er
a1us3r2TtKEDBoVGjyrrGOLps8g75K9p0hPK1fBJfBv9wJpB0iLa/siVDH/tzyN7
XgP27MNmK1W9vKSNDgdD7St5gcFoM/Zc/2WCFdqtRssT71u7mXO8q/nKP3W9fDuM
l2k5GiS0uxHacoqLxsrr0yDdC46mZUDvJ11OHClU8FUr6aIZWBOYI1PoPVt68gjS
B93m+kM3qXj2X4PqpUzwWJcOzOdmKg+eWE7AQX7rd7ZTw7AxSxiZJwRuj/UBlUKb
tQIDAQAB
-----END PUBLIC KEY-----"
}