locals {

  github_roles = [

    "roles/run.admin",
    "roles/artifactregistry.admin",
    "roles/storage.admin",
    "roles/serviceusage.serviceUsageAdmin",
    "roles/iam.serviceAccountUser",
    "roles/iam.serviceAccountAdmin",
    "roles/logging.viewer",
    "roles/monitoring.viewer",
    "roles/browser"
  ]
}

resource "google_project_iam_member" "github_roles" {

  for_each = toset(local.github_roles)
  project = var.project_id
  role = each.value
  member = "serviceAccount:${var.github_service_account_email}"
}



locals {

  runtime_roles = [

    "roles/logging.logWriter",
    "roles/monitoring.metricWriter"
  ]
}

resource "google_project_iam_member" "runtime_roles" {

  for_each = toset(local.runtime_roles)
  project = var.project_id
  role = each.value
  member = "serviceAccount:${var.runtime_service_account_email}"
}
