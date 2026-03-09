provider "aws" {
  region = "eu-central-1"
}

resource "aws_security_group" "docker_web_sg" {
  name        = "terraform-docker-web-sg"
  description = "Allow SSH and HTTP"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "docker_web_server" {
  ami                    = "ami-04e601abe3e1a910f"
  instance_type          = "t3.micro"
  key_name               = "unc-terraform-key"
  vpc_security_group_ids = [aws_security_group.docker_web_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install -y docker.io
              systemctl start docker
              systemctl enable docker
              docker run -d -p 80:80 nginx
              EOF

  tags = {
    Name = "terraform-docker-web-server"
  }
}
