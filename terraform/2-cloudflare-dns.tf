# https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/record
resource "cloudflare_record" "unraid" {
  zone_id = var.cloudflare_zone_id
  name    = "unraid"
  value   = "${var.cloudflare_tunnel_id}.cfargotunnel.com"
  type    = "CNAME"
  ttl     = 1
  proxied = true

  allow_overwrite = true
}

# https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/record
resource "cloudflare_record" "traefik" {
  zone_id = var.cloudflare_zone_id
  name    = "traefik"
  value   = "unraid.${local.domain_name}"
  type    = "CNAME"
  ttl     = 1
  proxied = true

  allow_overwrite = true
}

# https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/record
resource "cloudflare_record" "plex" {
  zone_id = var.cloudflare_zone_id
  name    = "plex"
  value   = "${cloudflare_record.traefik.name}.${local.domain_name}"
  type    = "CNAME"
  ttl     = 1
  proxied = true

  allow_overwrite = true
}

# https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/record
resource "cloudflare_record" "auth" {
  zone_id = var.cloudflare_zone_id
  name    = "auth"
  value   = "${cloudflare_record.traefik.name}.${local.domain_name}"
  type    = "CNAME"
  ttl     = 1
  proxied = true

  allow_overwrite = true
}

# https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/record
resource "cloudflare_record" "code_server" {
  zone_id = var.cloudflare_zone_id
  name    = "code-server"
  value   = "${cloudflare_record.traefik.name}.${local.domain_name}"
  type    = "CNAME"
  ttl     = 1
  proxied = true

  allow_overwrite = true
}

# https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/record
# resource "cloudflare_record" "plex" {
#   zone_id = var.cloudflare_zone_id
#   name    = "homeassistant"
#   value   = "${cloudflare_record.traefik.name}.${local.domain_name}"
#   type    = "CNAME"
#   ttl     = 1
#   proxied = true

#   allow_overwrite = true
# }
