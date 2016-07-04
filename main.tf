provider "aws" {
}

variable "app_name" {}

resource "aws_security_group" "sg" {
  name = "${var.app_name}"
  description = "Application ${var.app_name}"

  vpc_id = "${data.terraform_remote_state.env.vpc_id}"

  lifecycle {
    create_before_destroy = true
  }

  tags {
    "Name" = "${var.context_org}-${var.context_env}-${var.app_name}"
  }
}
