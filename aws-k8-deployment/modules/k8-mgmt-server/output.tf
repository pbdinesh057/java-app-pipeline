output "ec2_instance" {
    value = aws_instance.ec2_instance.id
}


output "s3" {
    value = aws_s3_bucket.s3-backend.bucket
}