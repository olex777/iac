terraform {
  backend "remote" {
    organization = "Lesson12_olex777"

    workspaces {
      name = "alfa"
    }
  }
}
