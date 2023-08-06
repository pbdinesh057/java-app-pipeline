output "ec2_instance" {
    value = aws_instance.ec2_instance.id
}

output "ec2_instance" {
    value = aws_instance.ec2_instance.public_ip
}

output "ec2_instance" {
    value = aws_instance.ec2_instance.public_dns
}

output "ec2_instance" {
    value = aws_instance.ec2_instance.private_ip
}

output "s3" {
    value = aws_s3_bucket.s3-backend.bucket
}