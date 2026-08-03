terraform {
  backend "gcs" {
    bucket = "cq-frontend-dev-123456-tf-state"
    prefix = "cloud-run/frontend"
  }
}
