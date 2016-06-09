provider "aws" {
  region = "${var.provider_region}"
}

resource "terraform_remote_state" "env" {
  backend = "s3"
  config {
    bucket = "${var.bucket_remote_state}"
    key = "${var.bucket_remote_state}/env-${var.context_org}-${var.context_env}.tfstate"
    region = "${var.provider_region}"
  }
}
