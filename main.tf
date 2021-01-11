provider "google" {
  #   version = "3.5.0"
  # Update credentials to the correct location, alternatively set   GOOGLE_APPLICATION_CREDENTIALS=/path/to/.ssh/bq-key.json in your shell session and   remove the credentials attribute.
  #   credentials = file("cliu201-sa.json")
  project = var.gcp_project_id

  region = var.gcp_region

}

provider "aws" {
  # version = "~> 2.60.0"

  shared_credentials_file = pathexpand(var.aws_credentials_file_path)

  region = var.aws_region
}

