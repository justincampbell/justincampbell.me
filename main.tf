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

resource "dnsimple_zone_record" "apex_a" {
  count     = 4
  zone_name = var.domain
  name      = ""
  type      = "A"
  ttl       = 3600

  value = [
    "185.199.108.153",
    "185.199.109.153",
    "185.199.110.153",
    "185.199.111.153"
  ][count.index]
}

resource "dnsimple_zone_record" "apex_aaaa" {
  count     = 4
  zone_name = var.domain
  name      = ""
  type      = "AAAA"
  ttl       = 3600

  value = [
    "2606:50c0:8000::153",
    "2606:50c0:8001::153",
    "2606:50c0:8002::153",
    "2606:50c0:8003::153"
  ][count.index]
}

resource "dnsimple_zone_record" "www_cname" {
  zone_name = var.domain
  name      = "www"
  value     = "${var.github_username}.github.io"
  type      = "CNAME"
  ttl       = 3600
}
