#############################################
# Terraform State Bucket
#############################################

resource "google_storage_bucket" "terraform_state" {

  name                        = var.terraform_state_bucket_name

  project                     = var.project_id

  location                    = var.region

  storage_class               = "STANDARD"

  uniform_bucket_level_access = true

  force_destroy               = false

  public_access_prevention    = "enforced"

  versioning {
    enabled = true
  }

  lifecycle_rule {

    condition {
      age = 90
    }

    action {
      type = "Delete"
    }

  }

  labels = {
    managed_by = "terraform"
    purpose    = "terraform-state"
  }

}


#############################################
# GitHub Actions Service Account
#############################################

resource "google_service_account" "github_actions" {

  project = var.project_id

  account_id = var.github_service_account_name

  display_name = "GitHub Actions Service Account"

  description = "Service Account used by GitHub Actions through Workload Identity Federation"

}


#########################################################
# Workload Identity Pool
#########################################################

resource "google_iam_workload_identity_pool" "github_pool" {

  project = var.project_id

  workload_identity_pool_id = var.workload_identity_pool_id

  display_name = "GitHub Actions Pool"

  description = "OIDC Pool for GitHub Actions"

  disabled = false

}


#########################################################
# Workload Identity Provider
#########################################################

resource "google_iam_workload_identity_pool_provider" "github_provider" {

  project = var.project_id

  workload_identity_pool_id = google_iam_workload_identity_pool.github_pool.workload_identity_pool_id

  workload_identity_pool_provider_id = var.workload_identity_provider_id

  display_name = "GitHub Actions Provider"

  description = "OIDC Provider for GitHub Actions"

  attribute_mapping = {

    "google.subject"       = "assertion.sub"

    "attribute.actor"      = "assertion.actor"

    "attribute.repository" = "assertion.repository"

    "attribute.ref"        = "assertion.ref"

  }

  attribute_condition = "assertion.repository == '${var.github_owner}/${var.github_repository}'"

  oidc {

    issuer_uri = "https://token.actions.githubusercontent.com"

  }

}


#########################################################
# Allow GitHub Actions to impersonate Service Account
#########################################################

resource "google_service_account_iam_member" "github_actions" {

  service_account_id = google_service_account.github_actions.name

  role = "roles/iam.workloadIdentityUser"

  member = "principalSet://iam.googleapis.com/${google_iam_workload_identity_pool.github_pool.name}/attribute.repository/${var.github_owner}/${var.github_repository}"

}


#########################################################
# Bootstrap IAM Roles
#########################################################

locals {

  bootstrap_roles = [

    "roles/run.admin",

    "roles/artifactregistry.admin",

    "roles/storage.admin",

    "roles/serviceusage.serviceUsageAdmin",

    "roles/iam.serviceAccountUser",

    "roles/logging.viewer",

    "roles/monitoring.viewer"

  ]

}

resource "google_project_iam_member" "github_actions_roles" {

  for_each = toset(local.bootstrap_roles)

  project = var.project_id

  role = each.value

  member = "serviceAccount:${google_service_account.github_actions.email}"

}
