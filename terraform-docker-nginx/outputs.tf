output "server_public_ip" {
  value = aws_instance.docker_web_server.public_ip
}

output "website_url" {
  value = "http://${aws_instance.docker_web_server.public_ip}"
}
