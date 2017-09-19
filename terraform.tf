terraform {
  backend "s3" {
    bucket = "justincampbell"
    key    = "terraform/justincampbell.me.tfstate"
  }
}

locals {
  domain = "justincampbell.me"
}

module "staticsite" {
  source = "justincampbell/staticsite/aws"
  bucket = "${local.domain}"
  domain = "${local.domain}"
}

resource "dnsimple_record" "apex" {
  domain = "${local.domain}"
  name   = ""
  type   = "ALIAS"
  value  = "${module.staticsite.website_endpoint}"
}

resource "dnsimple_record" "www" {
  domain = "${local.domain}"
  name   = "www"
  type   = "URL"
  value  = "http://${local.domain}"
}

resource "dnsimple_record" "cloudapp" {
  domain = "${local.domain}"
  name   = "c"
  type   = "CNAME"
  value  = "proxy.cld.me"
}
