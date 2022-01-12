terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}
provider "google" {
  version = "3.5.0"
  project = "azuredevops-test-dorin"
  region  = "us-central1"
  zone    = "us-central-a"
}

#TF-first instance from exercise-TF1
resource "google_compute_instance" "default" {
  project      = "azuredevops-test-dorin"
  name         = "tf-instance-1"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"
  boot_disk {
    initialize_params {
      image = "debian-10-buster-v20211209"
    }
  }
  #startup-script for TF1
  metadata_startup_script = <<-EOT
        #!/bin/bash
    EOT
  allow_stopping_for_update = true
  network_interface {
    network = "default"
    access_config {
    }
  }
}
