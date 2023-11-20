provider "google" {
  project = "digger-landing"
  region  = "europe-west2"
  zone    = "europe-west2-a"
}

resource "google_compute_network" "vpc_network" {
  name = "digger-demo-terragrunt-gcp-network-prod"
}

resource "google_compute_instance" "vm_instance" {
  name         = "digger-demo-terragrunt-gcp-prod"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.name
    access_config {
    }
  }
}