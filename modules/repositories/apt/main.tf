resource "google_artifact_registry_repository" "default" {
  repository_id = "apt-standard"
  description   = "APT repository"
  format        = "APT"
  mode          = "STANDARD_REPOSITORY"
}
