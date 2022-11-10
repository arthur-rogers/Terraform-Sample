provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-09d3b3274b6c5d4aa"
  instance_type = "t2.micro"
  user_data     = <<-EOF
              #!/bin/bash
              echo "Hello, World!" >> index.html
              nohup busybox httpd -f -p 8080 &
              EOF

  tags = {
    "Name" = "SampleTerraform"
  }
}

output "ec2_instance" {
  value = aws_instance.example.tags.Name
}