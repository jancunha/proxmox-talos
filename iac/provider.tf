terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "3.0.2-rc04"
    }
  }

  backend "s3" {
    bucket = "tf-stage-backup"
    key    = "proxmox/pve/terraform.tfstate"
    region = "us-east-1"
    use_lockfile = true
  }
}

provider "proxmox" {
  pm_api_url      = var.pm_api_url
  pm_tls_insecure = true
}