resource "aws_instance" "example" {
  ami           = "ami-020cba7c55df1f615" // Replace with a valid AMI ID
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.example_sg.id]

  
  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "<html><body><h1>EC2 Instance is working!</h1></body></html>" > /var/www/html/index.html
              EOF

  tags = {
    Name = "ExampleInstance"
  }
}
