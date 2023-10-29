resource "time_static" "time" {}

locals {
  tags = {
    Environment  = var.env
    Service      = var.service
    CreationDate = formatdate("YYYY-MM-DD", time_static.time.rfc3339)
  }
}

resource "aws_s3_bucket" "this" {
  bucket = "${var.service}-${var.name}-${var.env}"
  tags   = local.tags

  lifecycle {
    prevent_destroy = false
  }
}

resource "aws_s3_bucket_versioning" "terraform_state_bucket_versioning" {
  count = var.versioning_enabled ? 1 : 0

  bucket = aws_s3_bucket.this.id
  versioning_configuration {
    status = "Enabled"
  }
}
