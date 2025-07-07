# resource "null_resource" "stop_instance" {
#   provisioner "local-exec" {
#     command = "aws ec2 stop-instances --instance-ids ${aws_instance.example.id}"
#   }
#   triggers = {
#     instance_id = aws_instance.example.id
#   }
# }