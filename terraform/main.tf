resource "opennebula_virtual_machine" "vm" { 
  name         = "mf_secaudit_dmz_l01"
  template_id  = 2451
  memory       = 1024
  cpu          = 2

  nic = [
    {
      network_id = 10
    }
  ]
}

locals {
  full_minio_endpoint = format("https://%s:%s", var.minio_endpoint, var.minio_port)
}

terraform {
  required_providers {
    opennebula = {
      source  = "OpenNebula/opennebula"
      version = ">= 1.4.1"
    }
  } 
 backend "s3" {
    bucket                     = var.minio_bucket
    key                        = "tfstate/secaudit.tfstate"
    region                     = "us-east-1"
    endpoint                   = full_minio_endpoint
    access_key                 = var.minio_access_key
    secret_key                 = var.minio_secret_key
    force_path_style           = true
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_requesting_account_id  = true
  }
}

provider "opennebula" {
  endpoint = var.opennebula_endpoint
  username = var.opennebula_username
  password = var.opennebula_password
}