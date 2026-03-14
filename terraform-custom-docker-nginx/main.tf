provider "aws" {
  region = var.aws_region
}

resource "aws_security_group" "web_sg" {
  name        = "custom-docker-nginx-sg"
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

resource "aws_instance" "web" {
  ami                    = "ami-0e872aee57663ae2d"
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install -y docker.io
              systemctl start docker
              systemctl enable docker

              mkdir -p /home/ubuntu/app

              cat > /home/ubuntu/app/index.html <<'HTML'
              <!DOCTYPE html>
              <html lang="en">
              <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Cloud Learning Journey</title>
                <style>
                  body {
                    margin: 0;
                    font-family: Arial, sans-serif;
                    background: linear-gradient(135deg, #0f172a, #1e293b);
                    color: white;
                    display: flex;
                    justify-content: center;
                    align-items: center;
                    height: 100vh;
                    text-align: center;
                  }

                  .container {
                    max-width: 700px;
                    padding: 30px;
                  }

                  h1 {
                    font-size: 2.5rem;
                    margin-bottom: 10px;
                  }

                  p {
                    font-size: 1.1rem;
                    line-height: 1.6;
                    color: #cbd5e1;
                  }

                  .tag {
                    margin-top: 20px;
                    display: inline-block;
                    padding: 10px 18px;
                    border: 1px solid #38bdf8;
                    border-radius: 999px;
                    color: #38bdf8;
                    font-weight: bold;
                  }
                </style>
              </head>
              <body>
                <div class="container">
                  <h1>Cloud Learning Journey</h1>
                  <p>
                    This custom Nginx website is running inside a Docker container on an AWS EC2 instance,
                    deployed automatically using Terraform.
                  </p>
                  <p>
                    Project 4 of my cloud learning journey.
                  </p>
                  <div class="tag">AWS + Terraform + Docker + Nginx</div>
                </div>
              </body>
              </html>
              HTML

              cat > /home/ubuntu/app/Dockerfile <<'DOCKER'
              FROM nginx:latest
              COPY index.html /usr/share/nginx/html/index.html
              DOCKER

              cd /home/ubuntu/app
              docker build -t custom-nginx-site .
              docker run -d -p 80:80 --name custom-nginx custom-nginx-site
              EOF

  tags = {
    Name = "terraform-custom-docker-nginx"
  }
}
