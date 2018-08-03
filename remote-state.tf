terraform {
 backend "s3" {
 encrypt        = true
 bucket         = "scb-terraform-state"
 region         = "ap-southeast-1"
 key            = "terraform-demo.tfstate"
 }
}