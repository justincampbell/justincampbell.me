provider "aws" {
  region = "us-east-1"
}

variable "bucket" {
  default = "justincampbell.me"
}

resource "dnsimple_record" "apex" {
  domain = "${var.bucket}"
  name   = ""
  type   = "ALIAS"
  value  = "${aws_s3_bucket.default.website_endpoint}"
}

resource "aws_s3_bucket" "default" {
  bucket = "${var.bucket}"
  acl    = "public-read"
  policy = "${template_file.policy.rendered}"

  website {
    index_document = "index.html"
  }
}

resource "template_file" "policy" {
  filename = "policy.json"

  vars {
    bucket = "${var.bucket}"
  }
}
