#############################################
# GCP Configuration
#############################################

project_id = "cq-frontend-dev-123456"

region = "asia-south1"

#############################################
# Terraform State Bucket
#############################################

terraform_state_bucket_name = "cq-frontend-dev-123456-tf-state"

#############################################
# GitHub
#############################################

github_owner = "amit-rgs"

github_repository = "terraform"

#############################################
# Service Account
#############################################

github_service_account_name = "github-actions-sa"

#############################################
# Workload Identity
#############################################

workload_identity_pool_id = "github-pool"

workload_identity_provider_id = "github-provider"
