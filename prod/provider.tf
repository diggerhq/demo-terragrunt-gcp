# Generated by Terragrunt. Sig: nIlQXj57tbuaRZEa
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
