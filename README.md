# GCP Artifact Registry

Log in to the GCP platform:

```sh
gcloud auth login
gcloud auth application-default login
```

Create the infrastructure:

```sh
terraform plan
terraform apply -auto-approve
```

## Chrome APT

### Upload

Create a local temporary directory:

```sh
mkdir .tmp
```

Download the Google Ghrome installation file:

```sh
curl -L https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -o .tmp/chrome.deb
```

Set the project:

```sh
CLOUDSDK_CORE_PROJECT=""
```

Upload the package:

```sh
gcloud artifacts apt upload apt-standard --source=".tmp/chrome.deb" --location "southamerica-east1"
```

