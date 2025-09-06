terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "3.0.2-rc04"
    }
  }
}

provider "proxmox" {
  pm_api_url      = var.pm_api_url
  pm_user         = var.pm_user
  # pm_token_id     = var.pm_token_id
  # pm_token_secret = var.pm_token_secret
  pm_tls_insecure = true
}