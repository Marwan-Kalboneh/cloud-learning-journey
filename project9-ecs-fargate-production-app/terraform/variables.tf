variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "eu-central-1"
}

variable "github_owner" {
  description = "GitHub username or organization"
  type        = string
  default     = "Marwan-Kalboneh"
}

variable "github_repo" {
  description = "GitHub repository name"
  type        = string
  default     = "cloud-learning-journey"
}
