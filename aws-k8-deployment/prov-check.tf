
# # provisioner "local-exec" {
# #     command = "echo Instance with ${aws_instance.ec2_instance.public_ip} ${aws_instance.ec2_instance.private_ip} Created!! >> /tmp/ec2details.txt"
# #   }

  


# #   connection {
# #     type        = "ssh"
# #     user        = "ubuntu"  # Update with the appropriate user for your AMI
# #     private_key = file("~/.ssh/id_rsa")  # Update with the path to your private key
# #     host        = self.public_ip
# #   }

# #   provisioner "file" {
# #     source      = "setup_kubernetes.sh"
# #     destination = "~/setup_kubernetes.sh"
# #   }

# #   # Execute the shell script on the instance after it is copied
# #   provisioner "remote-exec" {
# #     inline = [
# #       "chmod +x ~/setup_kubernetes.sh",
# #       "bash ~/setup_kubernetes.sh"
# #     ]
# #   }


#     provisioner "local-exec" {
#     command = "echo Instance with ${aws_instance.ec2_instance.public_ip} ${aws_instance.ec2_instance.private_ip} Created!! >> /tmp/ec2details.txt"
#   }

#    connection {
#     type        = "ssh"
#     user        = "ubuntu"  # Update with the appropriate user for your AMI
#     private_key = file("~/.ssh/id_rsa")  # Update with the path to your private key
#     host        = self.public_ip
#   }
#     provisioner "file" {
#       source      = "kops.sh"
#       destination = "/tmp/kops.h"
#   }

    
#     # You can add other configuration settings here as needed
