
# https://pbhadani.com/posts/gke-terraform/

# Specify the GCP Provider
provider "google" {
  project = var.project_id
  region  = var.region
  version = "~> 3.31"
  alias   = "gb3"
}

# Create a GKE cluster
resource "google_container_cluster" "coffeewip_cluster" {
  provider           = google.gb3
  name               = "coffeewip-cluster"
  location           = var.region
  initial_node_count = 1

  master_auth {
    username = ""
    password = ""
  }

  # Enable Workload Identity
  workload_identity_config {
    identity_namespace = "${var.project_id}.svc.id.goog"
  }

  node_config {
    machine_type = var.machine_type
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]

    metadata = {
      "disable-legacy-endpoints" = "true"
    }

    # workload_metadata_config {
    #   node_metadata = "GKE_METADATA_SERVER"
    # }

    labels = { # Update: Replace with desired labels
      "environment" = "test"
      "team"        = "devops"
    }
  }
}