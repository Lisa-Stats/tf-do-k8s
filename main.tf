provider "digitalocean" {}

module "my_vpc" {
  source   = "./modules/vpc"

  name     = "clj-network"
  region   = "tor1"
  ip_range = "10.10.10.0/24"
}

module "kubernetes" {
  source  = "./modules/doks"

  cluster_name       = "clj-cluster"
  auto_upgrade       = true
  region             = "tor1"
  vpc_uuid           = module.my_vpc.vpc_id

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
      node_tags                     = ["test-node-pool-tag"]
      maintenance_policy_day        = "sunday"
      maintenance_policy_start_time = "04:00"
    }
  }
}
