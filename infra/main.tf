provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_project_service" "pubsub" {
  project = var.project_id
  service = "pubsub.googleapis.com"
}

resource "google_project_service" "cloudbuild" {
  project = var.project_id
  service = "cloudbuild.googleapis.com"
}

resource "google_pubsub_topic" "celery_tasks" {
  name     = "celery-tasks"
  project  = var.project_id
  depends_on = [google_project_service.pubsub]
}

resource "google_pubsub_subscription" "celery_tasks_sub" {
  name     = "celery-tasks-sub"
  topic    = google_pubsub_topic.celery_tasks.id
  project  = var.project_id
  ack_deadline_seconds = 20
}