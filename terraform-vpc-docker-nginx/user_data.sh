#!/bin/bash
apt-get update -y
apt-get install -y docker.io

systemctl enable docker
systemctl start docker

docker run -d -p 80:80 nginx
