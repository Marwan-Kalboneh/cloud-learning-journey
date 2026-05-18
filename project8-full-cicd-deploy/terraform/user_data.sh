#!/bin/bash
dnf update -y
dnf install -y docker awscli

systemctl enable docker
systemctl start docker

usermod -aG docker ec2-user
