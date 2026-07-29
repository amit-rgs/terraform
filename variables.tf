#############################################
# GCP Project Configuration
#############################################

variable "project_id" {
  description = "Google Cloud Project ID"
  type        = string
}

variable "region" {
  description = "Google Cloud Region"
  type        = string
  default     = "asia-south1"
}

variable "environment" {
  description = "Deployment Environment"
  type        = string

  validation {
    condition     = contains(["dev", "test", "prod"], var.environment)
    error_message = "Environment must be one of: dev, test, prod."
  }
}

#############################################
# Artifact Registry
#############################################

variable "artifact_registry_name" {
  description = "Artifact Registry Repository Name"
  type        = string
  default     = "frontend-repo"
}

#############################################
# Cloud Run
#############################################

variable "cloud_run_service_name" {
  description = "Cloud Run Service Name"
  type        = string
}

variable "container_port" {
  description = "Container Port"
  type        = number
  default     = 3000
}

variable "cpu" {
  description = "CPU allocated to Cloud Run"
  type        = string
  default     = "1"
}

variable "memory" {
  description = "Memory allocated to Cloud Run"
  type        = string
  default     = "512Mi"
}

variable "max_instances" {
  description = "Maximum Cloud Run Instances"
  type        = number
  default     = 5
}

variable "min_instances" {
  description = "Minimum Cloud Run Instances"
  type        = number
  default     = 0
}

#############################################
# Service Accounts
#############################################

variable "github_service_account_name" {
  description = "GitHub Actions Service Account"
  type        = string
  default     = "github-actions-sa"
}

variable "runtime_service_account_name" {
  description = "Cloud Run Runtime Service Account"
  type        = string
  default     = "cloudrun-runtime-sa"
}

#############################################
# Docker Image
#############################################

variable "image_name" {
  description = "Docker Image Name"
  type        = string
  default     = "frontend"
}

#############################################
# Common Labels
#############################################

variable "labels" {
  description = "Common Labels"
  type        = map(string)

  default = {
    managed-by = "terraform"
  }
}
