resource "opennebula_virtual_machine" "demolab_dmz_L01" { 
  name         = "mf_myslivets_secaudit_tlab_dmz-L01"
  template_id  = 2458
  memory       = 1024
  cpu          = 2
}

resource "opennebula_virtual_machine" "demolab_internal_L02" { 
  name         = "mf_myslivets_secaudit_tlab_internal-L02"
  template_id  = 2465
  memory       = 1024
  cpu          = 2
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
    endpoint                   = var.minio_endpoint
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