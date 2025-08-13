output "pubsub_topic" {
  value = google_pubsub_topic.celery_tasks.name
}
output "pubsub_subscription" {
  value = google_pubsub_subscription.celery_tasks_sub.name
}
output "cloudbuild_trigger_id" {
  value = google_cloudbuild_trigger.main_branch_trigger.id
}