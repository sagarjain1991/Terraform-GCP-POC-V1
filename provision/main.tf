
terraform {
  required_version = ">= 0.14"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.29.0, < 5.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "< 5.0, >= 3.45"
    }
    
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.10"
    }
  }
}


provider "google" {
    project = var.project_id 
}

data "google_project" "project" {
    project_id = var.project_id    
}

locals {
    bucket_type = "REGIONAL"
    region = var.region == null ? var.subnet_region : var.region
}

data "google_compute_zones" "available" {
}
