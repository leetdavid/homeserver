
# https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/record
resource "cloudflare_record" "plex" {
  zone_id = var.cloudflare_zone_id
  name    = "plex"
  value   = "traefik.${local.domain_name}"
  type    = "CNAME"
  ttl     = 1
  proxied = true
}
