variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "Artifact Registry Region"
  type        = string
}

variable "repository_name" {
  description = "Artifact Registry Repository Name"
  type        = string
}

variable "description" {
  description = "Repository Description"
  type        = string
  default     = "Docker repository managed by Terraform"
}

variable "labels" {
  description = "Labels"
  type        = map(string)
  default     = {}
}
