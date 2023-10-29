variable "env" {
  type        = string
  description = "Current environment"
}

variable "region" {
  description = "Current aws region"
  default     = "us-east-2"
}
