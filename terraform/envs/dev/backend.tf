terraform {
  backend "s3" {
    bucket         = "my-webapp-tf-state-brent-2025"
    key            = "dev/terraform.tfstate"
    region         = "us-west-2"
    dynamodb_table = "webapp-tf-locks"
    encrypt        = true
  }
}
