provider "digitalocean" {
  token = var.do_token
}

resource "digitalocean_vpc" "lisa_vpc" {
  name     = "clj-network"
  region   = "tor1"
  ip_range = "10.10.10.0/24"
}

module "kubernetes" {
  source  = "aigisuk/doks/digitalocean"
  version = "0.1.1"

  cluster_name       = "clj-cluster"
  auto_upgrade       = true
  region             = "tor1"
  kubernetes_version = "1.24.4-do.0"
  vpc_uuid           = digitalocean_vpc.lisa_vpc.id

  size        = "s-1vcpu-2gb"
  auto_scale  = false
  min_nodes   = 2
  max_nodes   = 4
  node_count  = 2
  node_labels = {
    env = "dev"
    service = "kubernetes"
    made-by = "terraform"
  }
  node_tags = ["dev-node-pool-tag"]
  maintenance_policy_day = "sunday"
  maintenance_policy_start_time = "04:00"

  node_pools = {
    "test" = {
      size        = "s-1vcpu-2gb"
      auto_scale  = false
      min_nodes   = 2
      max_nodes   = 4
      node_count  = 2
      node_labels = {
        env = "test"
        service = "kubernetes"
        made-by = "terraform"
      }
      node_tags = ["test-node-pool-tag"]
      maintenance_policy_day = "sunday"
      maintenance_policy_start_time = "04:00"
    }
  }
}
