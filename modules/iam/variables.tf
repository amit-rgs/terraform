variable "project_id" {
  description = "Google Cloud Project ID"
  type        = string
}

variable "github_service_account_email" {
  description = "GitHub Actions Service Account Email"
  type        = string
}

variable "runtime_service_account_email" {
  description = "Cloud Run Runtime Service Account Email"
  type        = string
}
