output "instance_ip" {
  value = aws_instance.example.public_ip
}

output "instance_id" {
  value = aws_instance.example.id
}

output "instance_type" {
  value = aws_instance.example.instance_type
}
output "instance_private_ip" {
  value = aws_instance.example.private_ip
}