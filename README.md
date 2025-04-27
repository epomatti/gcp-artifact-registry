# GCP Artifact Registry

Log in to the GCP platform:

```sh
gcloud auth login
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

Set the project variable:

```sh
export CLOUDSDK_CORE_PROJECT="<PROJECT_ID>"
```

Upload the package:

```sh
gcloud artifacts apt upload apt-standard --source=".tmp/chrome.deb" --location "southamerica-east1"
```

### Install

Download the key:

```sh
curl -L https://southamerica-east1-apt.pkg.dev/doc/repo-signing-key.gpg | gpg --dearmor | sudo tee /etc/apt/keyrings/repo-signing-key.gpg > /dev/null
```

Set the repository entry, replacing the **PROJECT_ID** and **REPOSITORY_NAME**:

```sh
echo 'deb [signed-by=/etc/apt/keyrings/repo-signing-key.gpg] https://southamerica-east1-apt.pkg.dev/projects/<PROJECT_ID> <REPOSITORY_NAME> main' | sudo tee -a /etc/apt/sources.list.d/artifact-registry.list
```

Install the packages:

> [!TIP]
> The repository has been set to public by setting permissions to `allUsers`

```sh
sudo apt install chrome-chrome-stable/<REPOSITORY_NAME>
```

More deatils can be found in the [troubleshooting](https://cloud.google.com/artifact-registry/docs/os-packages/troubleshoot) guide.
