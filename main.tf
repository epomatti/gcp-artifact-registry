terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 6.0.0"
    }
  }
}

module "apt_standard" {
  source = "./modules/repositories/apt"
}

module "debian_buster_remote" {
  source = "./modules/repositories/debian"
}
