data "digitalocean_kubernetes_versions" "doks" {
  version_prefix = "1.25."
}

data "digitalocean_sizes" "doks" {
  filter {
    key    = "slug"
    values = [var.size]
  }

  filter {
    key    = "regions"
    values = [var.region]
  }
}
