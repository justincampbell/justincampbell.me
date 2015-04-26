provider "aws" { region = "us-east-1" }

resource "dnsimple_record" "apex" {
  domain = "justincampbell.me"
  name = ""
  type = "ALIAS"
  value = "${aws_s3_bucket.default.website_endpoint}"
}

resource "aws_s3_bucket" "default" {
  bucket = "justincampbell.me"
  acl = "public-read"

  website {
    index_document = "index.html"
  }
}
