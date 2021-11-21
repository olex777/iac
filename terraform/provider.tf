terraform {
  backend "remote" {
    organization = "Lesson12_olex777"

    workspaces {
      name = "alfa"
    }
  }
}

provider "aws" {
  region = "eu-central-1"
}

