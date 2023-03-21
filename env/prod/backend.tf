terraform {
  backend "s3" {
    bucket = "nome-bucket"
    key    = "prod/terraform.tfstate"
    region = "us-east-2"
  }
}
