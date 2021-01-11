
/*
 * Terraform security (firewall) resources for GCP.
 */

# Allow PING testing.
resource "google_compute_firewall" "gcp-allow-icmp" {
  name    = "${google_compute_network.gcp-network.name}-gcp-allow-icmp"
  network = google_compute_network.gcp-network.name

  allow {
    protocol = "icmp"
  }

  source_ranges = [
    "0.0.0.0/0",
  ]
}

# Allow SSH 
# resource "google_compute_firewall" "gcp-allow-ssh" {
#   name    = "${google_compute_network.gcp-network.name}-gcp-allow-ssh"
#   network = google_compute_network.gcp-network.name

#   allow {
#     protocol = "tcp"
#     ports    = ["22"]
#   }

#   source_ranges = [
#     "0.0.0.0/0",
#   ]
# }

# Allow traffic from the VPN subnets.
resource "google_compute_firewall" "gcp-allow-vpn" {
  name    = "${google_compute_network.gcp-network.name}-gcp-allow-vpn"
  network = google_compute_network.gcp-network.name

  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }

  allow {
    protocol = "udp"
    ports    = ["0-65535"]
  }

  // to be changed by cliu accourding to wind's aws vpc config
  source_ranges = [
    var.aws_subnet1_cidr,
  ]
}

# Allow TCP traffic from the Internet.
# resource "google_compute_firewall" "gcp-allow-internet" {
#   name    = "${google_compute_network.gcp-network.name}-gcp-allow-internet"
#   network = google_compute_network.gcp-network.name

#   allow {
#     protocol = "tcp"
#     ports    = ["80"]
#   }

#   source_ranges = [
#     "0.0.0.0/0",
#   ]
# }

