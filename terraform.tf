variable "domain" {
  default = "justincampbell.me"
}

module "terraform-s3-website" {
  source = "github.com/justincampbell/terraform-s3-website"
  bucket = "${var.domain}"
  domain = "${var.domain}"
  host   = "site"
}

resource "dnsimple_record" "apex" {
  domain = "${var.domain}"
  name   = ""
  type   = "ALIAS"
  value  = "${module.terraform-s3-website.website_endpoint}"
}

resource "dnsimple_record" "www" {
  domain = "${var.domain}"
  name   = "www"
  type   = "URL"
  value  = "http://${var.domain}"
}
