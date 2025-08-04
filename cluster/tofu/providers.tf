terraform {
  required_version = ">= 1.10.3"
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "2.5.3"
    }
    sops = {
      source  = "carlpett/sops"
      version = "1.2.1"
    }
  }
}
