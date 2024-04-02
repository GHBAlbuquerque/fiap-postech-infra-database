terraform {
  required_providers {
    mongodbatlas = {
      source = "mongodb/mongodbatlas"
      public_key = var.mongodbatlas_public_key
      private_key  = var.mongodbatlas_private_key
    }
  }
  required_version = ">= 0.13"
}


