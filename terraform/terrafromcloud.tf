terraform {
  backend "remote" {
    organization = "Lesson12_olex777"

    workspaces {
      name = "alfa"
    }
  }
}
provider "aws" {
  region     = "eu-central-1"
  access_key = "AKIAIOSFODNN6OLEX777"
  secret_key = "wJalrXUtnFEMI/K7MDENG/bPxRfiOLEX777KEY"
}

