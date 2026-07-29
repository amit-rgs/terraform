#############################################
# GitHub Actions Service Account
#############################################

resource "google_service_account" "github_actions" {

  project      = var.project_id

  account_id   = var.github_service_account_name

  display_name = "GitHub Actions Service Account"

  description  = "Used by GitHub Actions for Terraform and Cloud Run deployments"

}

#############################################
# Cloud Run Runtime Service Account
#############################################

resource "google_service_account" "cloudrun_runtime" {

  project      = var.project_id

  account_id   = var.runtime_service_account_name

  display_name = "Cloud Run Runtime Service Account"

  description  = "Runtime identity for Cloud Run"

}
