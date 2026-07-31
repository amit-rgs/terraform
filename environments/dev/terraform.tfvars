#########################################################
# GCP Project Configuration
#########################################################

project_id = "your-gcp-project-id"

region = "asia-south1"

environment = "dev"

#########################################################
# Artifact Registry
#########################################################

artifact_registry_name = "frontend-repo"

#########################################################
# Cloud Run
#########################################################

cloud_run_service_name = "cq-frontend"

container_port = 3000

cpu = "1"

memory = "512Mi"

min_instances = 0

max_instances = 1

#########################################################
# Docker Image
#########################################################

image_name = "frontend"

#########################################################
# Service Accounts
#########################################################

github_service_account_name = "github-actions-sa"

runtime_service_account_name = "cloudrun-runtime-sa"

#########################################################
# Common Labels
#########################################################

labels = {

  application = "cq-frontend"

  managed-by = "terraform"

  environment = "dev"

  owner = "devops"

  team = "frontend"

}
