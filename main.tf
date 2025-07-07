resource "aws_instance" "example" {
  ami           = "ami-020cba7c55df1f615" // Replace with a valid AMI ID
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.example_sg.id]
  key_name = aws_key_pair.terraform_instance.key_name

  user_data = <<-EOF
              #!/bin/bash
              exec > /var/log/user-data.log 2>&1
              set -x
              apt update -y
              apt install -y apache2
              systemctl start apache2
              systemctl enable apache2
              echo "<html><body><h1>EC2 Instance is working!</h1></body></html>" > /var/www/html/index.html
              EOF



  tags = {
    Name = "ExampleInstance"
  }
}
