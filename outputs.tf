output "artifact_registry_url" {
  value = module.artifact_registry.repository_url
}

output "github_actions_service_account" {
  value = module.service_accounts.github_service_account_email
}

output "runtime_service_account" {
  value = module.service_accounts.runtime_service_account_email
}
