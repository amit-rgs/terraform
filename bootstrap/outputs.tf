#########################################################
# Terraform State Bucket
#########################################################

output "terraform_state_bucket" {

  value = google_storage_bucket.terraform_state.name

}

#########################################################
# GitHub Service Account
#########################################################

output "github_service_account_email" {

  value = google_service_account.github_actions.email

}

#########################################################
# Workload Identity Pool
#########################################################

output "workload_identity_pool_name" {

  value = google_iam_workload_identity_pool.github_pool.name

}

#########################################################
# Workload Identity Provider
#########################################################

output "workload_identity_provider_name" {

  value = google_iam_workload_identity_pool_provider.github_provider.name

}

#########################################################
# Project ID
#########################################################

output "project_id" {

  value = var.project_id

}
