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

#############################################
# Terraform State Bucket
#############################################

variable "terraform_state_bucket_name" {
  description = "Terraform Remote State Bucket Name"
  type        = string
}

#############################################
# GitHub Repository
#############################################

variable "github_owner" {
  description = "GitHub Organization or Username"
  type        = string
}

variable "github_repository" {
  description = "GitHub Repository Name"
  type        = string
}

#############################################
# Service Account
#############################################

variable "github_service_account_name" {
  description = "GitHub Actions Service Account Name"
  type        = string
  default     = "github-actions-sa"
}

#############################################
# Workload Identity
#############################################

variable "workload_identity_pool_id" {
  description = "Workload Identity Pool ID"
  type        = string
  default     = "github-pool"
}

variable "workload_identity_provider_id" {
  description = "Workload Identity Provider ID"
  type        = string
  default     = "github-provider"
}
