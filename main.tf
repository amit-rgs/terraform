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



module "iam" {

  source = "./modules/iam"

  project_id = var.project_id

  github_service_account_email =
    module.service_accounts.github_service_account_email

  runtime_service_account_email =
    module.service_accounts.runtime_service_account_email

  depends_on = [
    module.service_accounts
  ]

}



module "cloud_run" {

  source = "./modules/cloud-run"
  project_id = var.project_id
  region = var.region
  service_name = var.cloud_run_service_name
  image = "${module.artifact_registry.repository_url}/${var.image_name}:latest"

  service_account_email =
    module.service_accounts.runtime_service_account_email
  cpu = var.cpu
  memory = var.memory
  container_port = var.container_port
  min_instances = var.min_instances
  max_instances = var.max_instances
  environment = var.environment
  labels = var.labels

  depends_on = [
    module.artifact_registry,
    module.iam
  ]
}
