provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = {
      project   = "ansible"
      silo      = "intern"
      terraform = "true"
      owner     = "anish.sapkota"
    }
  }
}