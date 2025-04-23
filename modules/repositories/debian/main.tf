resource "google_artifact_registry_repository" "default" {
  repository_id = "debian-buster-remote"
  description   = "Remote apt repository"
  format        = "APT"
  mode          = "REMOTE_REPOSITORY"

  remote_repository_config {
    description = "Debian buster remote repository"

    apt_repository {
      public_repository {
        repository_base = "DEBIAN"
        repository_path = "debian/dists/buster"
      }
    }
  }
}
