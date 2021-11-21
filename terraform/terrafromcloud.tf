terraform {
  backend "remote" {
    organization = "Lesson12_olex777"

    workspaces {
      name = "olex777"
    }
  }
}

provider "aws" {
  region = "eu-central-1"
}
