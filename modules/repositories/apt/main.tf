resource "google_artifact_registry_repository" "default" {
  repository_id = "apt-standard"
  description   = "APT repository"
  format        = "APT"
  mode          = "STANDARD_REPOSITORY"
}

# https://docs.prismacloud.io/en/enterprise-edition/policy-reference/google-cloud-policies/google-cloud-public-policies/ensure-gcp-artifact-registry-repository-is-not-anonymously-or-publicly-accessible
# https://cloud.google.com/artifact-registry/docs/access-control#public
resource "google_artifact_registry_repository_iam_binding" "public_binding" {
  repository = google_artifact_registry_repository.default.name
  role       = "roles/artifactregistry.reader"

  members = [
    "allUsers"
  ]
}
