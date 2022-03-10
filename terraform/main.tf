terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.5.0"
    }
  }
}

provider "google" {
  credentials = file(var.credentials_file)

  project = learn-git-action-terraform-gcp"
  region  = "us-central1"
  zone    = "us-central1-c"
}

resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}

resource "google_project_iam_member" "sa_terraform" {
   role    = "roles/owner"
   member  = "serviceAccount:${google_service_account.terraform.email}"
 }

resource "google_service_account" "test" {
  account_id    =    "test"
}
