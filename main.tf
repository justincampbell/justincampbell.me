terraform {
  required_providers {
    dnsimple = {
      source  = "dnsimple/dnsimple"
      version = "~> 1.0"
    }
  }

  cloud {
    hostname     = "app.terraform.io"
    organization = "justincampbell"

    workspaces {
      name = "justincampbell-me"
    }
  }
}

provider "dnsimple" {
}

variable "domain" {
  type    = string
  default = "justincampbell.me"
}

variable "github_username" {
  type    = string
  default = "justincampbell"
}

data "http" "github_meta" {
  url = "https://api.github.com/meta"
}

locals {
  github_meta = jsondecode(data.http.github_meta.response_body)
  pages_ipv4  = [for ip in local.github_meta.pages : split("/", ip)[0] if endswith(ip, "/32")]
  pages_ipv6  = [for ip in local.github_meta.pages : split("/", ip)[0] if endswith(ip, "/128")]
}

resource "dnsimple_zone_record" "apex_a" {
  count     = length(local.pages_ipv4)
  zone_name = var.domain
  name      = ""
  type      = "A"
  ttl       = 3600
  value     = local.pages_ipv4[count.index]
}

resource "dnsimple_zone_record" "apex_aaaa" {
  count     = length(local.pages_ipv6)
  zone_name = var.domain
  name      = ""
  type      = "AAAA"
  ttl       = 3600
  value     = local.pages_ipv6[count.index]
}

resource "dnsimple_zone_record" "www_cname" {
  zone_name = var.domain
  name      = "www"
  value     = "${var.github_username}.github.io"
  type      = "CNAME"
  ttl       = 3600
}
