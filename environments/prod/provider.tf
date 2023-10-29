provider "aws" {
  region = var.region
  assume_role {
    role_arn     = "arn:aws:iam::375158168967:role/terraform-provisioning"
    external_id  = "tf-admin"
    session_name = "dev-provisioning"
  }
}

terraform {
  backend "s3" {
    role_arn    = "arn:aws:iam::375158168967:role/terraform-state"
    external_id = "tf-admin"

    key            = "dev/terraform.tfstate"
    bucket         = "terraform-sandbox-dev-state"
    dynamodb_table = "terraform-sandbox-dev-state-lock"
    region         = "us-east-2"
    encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
