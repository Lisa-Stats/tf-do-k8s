resource "digitalocean_vpc" "my_vpc" {
  name     = var.name
  region   = var.region
  ip_range = var.ip_range
}
