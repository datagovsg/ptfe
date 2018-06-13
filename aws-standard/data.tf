data "terraform_remote_state" "vpc" {
  backend   = "s3"
  workspace = "${terraform.workspace}"

  config {
    region = "${var.vpc_state_region}"
    bucket = "${var.vpc_state_bucket}"
    key    = "${var.vpc_state_key}"
  }
}
