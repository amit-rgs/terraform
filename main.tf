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
