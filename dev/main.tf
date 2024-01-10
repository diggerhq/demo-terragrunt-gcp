resource "google_compute_network" "vpc_network" {
  name = "digger-demo-terragrunt-gcp-network-dev"
}

resource "google_compute_instance" "vm_instance" {
  name         = "digger-demo-terragrunt-gcp-dev"
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
