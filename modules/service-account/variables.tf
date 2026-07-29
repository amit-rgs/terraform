variable "project_id" {
  description = "Google Cloud Project ID"
  type        = string
}

variable "github_service_account_name" {
  description = "GitHub Actions Service Account"
  type        = string
}

variable "runtime_service_account_name" {
  description = "Cloud Run Runtime Service Account"
  type        = string
}
