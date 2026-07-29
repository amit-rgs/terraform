module "apis" {
  source = "./modules/apis"
  project_id = var.project_id
}


module "artifact_registry" {

  source = "./modules/artifact-registry"
  project_id      = var.project_id
  region          = var.region
  repository_name = var.artifact_registry_name
  labels = merge(
    var.labels,
    {
      environment = var.environment
    }
  )
  depends_on = [
    module.apis
  ]
}


module "service_accounts" {

  source = "./modules/service-account"
  project_id = var.project_id
  github_service_account_name = var.github_service_account_name
  runtime_service_account_name = var.runtime_service_account_name

  depends_on = [
    module.apis
  ]
}
