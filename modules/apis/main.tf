locals {

  required_services = [

    "run.googleapis.com",

    "artifactregistry.googleapis.com",

    "iam.googleapis.com",

    "cloudresourcemanager.googleapis.com",

    "serviceusage.googleapis.com",

    "secretmanager.googleapis.com",

    "logging.googleapis.com",

    "monitoring.googleapis.com"

  ]

}

resource "google_project_service" "services" {

  for_each = toset(local.required_services)

  project = var.project_id

  service = each.value

  disable_on_destroy = false

}
