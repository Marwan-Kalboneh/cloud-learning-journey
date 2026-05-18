variable "aws_region" {
  description = "AWS region for the project"
  type        = string
  default     = "eu-central-1"
}

variable "project_name" {
  description = "Project name used for AWS resources"
  type        = string
  default     = "project8-full-cicd-deploy"
}

variable "public_key_path" {
  description = "Path to the public SSH key for EC2"
  type        = string
  default     = "~/.ssh/project8-deploy-key.pub"
}

variable "allowed_ssh_cidr" {
  description = "CIDR block allowed to SSH into EC2. Use your IP later for better security."
  type        = string
  default     = "0.0.0.0/0"
}

variable "github_owner" {
  description = "Your GitHub username or organization"
  type        = string
}

variable "github_repo" {
  description = "GitHub repository name"
  type        = string
  default     = "cloud-learning-journey"
}

variable "github_branch" {
  description = "Branch allowed to assume the GitHub Actions IAM role"
  type        = string
  default     = "main"
}
