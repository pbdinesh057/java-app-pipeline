resource "aws_instance" "ec2_instance" {
    ami           = var.ami
    instance_type = var.instance_type
    tags = {
        Name = var.instance_name
    }
    key_name = filebase64(var.ssh_key_name)
    provisioner "local-exec" {
    command = "echo Instance with ${aws_instance.ec2_instance.public_ip} ${aws_instance.ec2_instance.private_ip} Created!! >> /tmp/ec2details.txt"
  }
    connection {
    type        = "ssh"
    user        = "ubuntu"  # Update with the appropriate user for your AMI
    private_key = file("/tmp/all.pem")  # Update with the path to your private key
    host        = self.public_ip
  }
    provisioner "file" {
    source      = "setup_kubernetes.sh"
    destination = "/tmp/setup_kubernetes.sh"
  }
    # Execute the shell script on the instance after it is copied
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/setup_kubernetes.sh",
      "bash /tmp/setup_kubernetes.sh"
    ]
  }
    # Set the key_name attribute to use the SSH key pair name variable

}

resource "aws_s3_bucket" "s3-backend" {
    bucket = var.bucket_name
    #acl    = "private"  # Change this to set the bucket ACL (e.g., "public-read")
    # You can add other configuration settings here as needed, like tags, logging, etc.
}

