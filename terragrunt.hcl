remote_state {
  backend = "gcs"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket = "digger-demo-terragrunt-gcp-backend"
    prefix = "${path_relative_to_include()}/terraform.tfstate"
    project = "digger-landing"
    location  = "europe-west2"
  }
}

generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.6.0"
    }
  }
}
provider "google" {
  project = "digger-landing"
  region  = "europe-west2"
  zone    = "europe-west2-a"
}
EOF
}