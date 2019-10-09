provider "aws" {
  region  = "eu-west-1"
  profile = "terraform"
}

resource "aws_s3_bucket" "b" {
  bucket = "terraformer-1234345677"
  acl    = "private"

  tags = {
    Name = "Bucket for test"
  }
}

output "test_output" {
    value = "${aws_s3_bucket.b.arn}"
}
