variable "region" {
  description = "GCP region"
  type        = string
  default     = "us-central1"
}

variable "project_id" {
  description = "GCP project ID"
  type        = string
  default     = "cto-tinaa-apps-svcs-np-461414"
}

variable "repo_owner" {
  description = "GitHub repo owner"
  type        = string
}

variable "repo_name" {
  description = "GitHub repo name"
  type        = string
}