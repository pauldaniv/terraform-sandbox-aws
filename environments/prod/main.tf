module "s3_storage" {
  source = "../../modules/storage"

  env     = var.env
  name    = "dummy-storage"
  service = "dummy-api"
}
