resource "google_artifact_registry_repository" "debian_remote" {
  repository_id = "debian-buster"
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
