resource "cloudflare_record" "example_cname" {
  zone_id = "deine_zone_id"
  name    = "subdomain"  # Der Name der Subdomain, z.B. "www" für "www.deine-domain.com"
  value   = "ziel.deine-domain.com"  # Der Zielwert für den CNAME-Record
  type    = "CNAME"
  ttl     = 1            # TTL (Time to Live), 1 steht für 'automatisch'
  proxied = false        # Setze auf true, wenn der Traffic über Cloudflare geleitet werden soll
}
