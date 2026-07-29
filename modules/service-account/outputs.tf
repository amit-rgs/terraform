output "github_service_account_email" {
  value = google_service_account.github_actions.email
}

output "runtime_service_account_email" {
  value = google_service_account.cloudrun_runtime.email
}

output "github_service_account_name" {
  value = google_service_account.github_actions.name
}

output "runtime_service_account_name" {
  value = google_service_account.cloudrun_runtime.name
}
