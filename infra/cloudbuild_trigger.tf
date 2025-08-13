resource "google_cloudbuild_trigger" "main_branch_trigger" {
  name        = "celery-pubsub-demo-main"
  description = "Trigger for main branch pushes"
  github {
    owner = var.repo_owner
    name  = var.repo_name
    push {
      branch = "^main$"
    }
  }
  filename = "cloudbuild.yaml"
  project  = var.project_id
}