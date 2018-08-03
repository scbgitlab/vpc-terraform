terraform {
  backend "s3" {
    encrypt        = true
    bucket         = "terraformstate-scb"
    region         = "ap-southeast-1"
    key            = "terraform-demo-dev.tfstate"
  }
}
