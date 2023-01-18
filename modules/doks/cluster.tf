resource digitalocean_kubernetes_cluster doks {
  name     = var.cluster_name
  region   = var.region
  version  = data.digitalocean_kubernetes_versions.doks.latest_version
  vpc_uuid = var.vpc_uuid

  auto_upgrade = var.auto_upgrade
  tags         = var.tags

  node_pool {
    name       = format("%s-default", var.cluster_name)
    size       = var.size
    auto_scale = var.auto_scale
    min_nodes  = var.min_nodes
    max_nodes  = var.max_nodes
    node_count = var.node_count
    tags       = var.node_tags
    labels     = var.node_labels
  }
  maintenance_policy {
    start_time = var.maintenance_policy_start_time
    day        = var.maintenance_policy_day
  }
}
