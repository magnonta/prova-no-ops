provider "aws" {
  version    = "~> 2.0"
  region     = "us-east-1"
  secret_key = var.secret_key
  access_key = var.access_key
}
