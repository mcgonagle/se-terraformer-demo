terraform {
  backend "s3" {}
}

provider "aws" {
  region  = "eu-west-1"
  profile = "terraform"
}

variable "environment_name" {
  default = "test"
}

resource "aws_s3_bucket" "b" {
  bucket = "terraformer-1234"
  acl    = "public-read"

  tags = {
    Name = "Bucket for ${var.environment_name}"
  }
}

output "test_output" {
    value = "${aws_s3_bucket.b.arn}"
}
