output "artifact_registry_url" {
  value = module.artifact_registry.repository_url
}

output "github_actions_service_account" {
  value = module.service_accounts.github_service_account_email
}

output "runtime_service_account" {
  value = module.service_accounts.runtime_service_account_email
}

output "cloud_run_url" {
  value = module.cloud_run.service_url
}

output "cloud_run_name" {
  value = module.cloud_run.service_name
}
