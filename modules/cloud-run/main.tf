resource "google_cloud_run_v2_service" "frontend" {

  name     = var.service_name
  location = var.region
  project  = var.project_id
  ingress = "INGRESS_TRAFFIC_ALL"
  template {

    service_account = var.service_account_email

    scaling {
      min_instance_count = var.min_instances
      max_instance_count = var.max_instances
    }

    containers {
      image = var.image
      ports {
        container_port = var.container_port
      }

      resources {
        limits = {
          cpu    = var.cpu
          memory = var.memory
        }
      }
    }

    labels = merge(
      var.labels,
      {
        environment = var.environment
      }
    )
  }

  traffic {
    percent = 100
    type = "TRAFFIC_TARGET_ALLOCATION_TYPE_LATEST"
  }

}


resource "google_cloud_run_v2_service_iam_member" "public" {

  project  = var.project_id
  location = var.region
  name     = google_cloud_run_v2_service.frontend.name

  role = "roles/run.invoker"

  member = "allUsers"

}
