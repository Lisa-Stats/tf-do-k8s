output "k8s-cluster-id" {
  value = module.kubernetes.cluster_id
}

output "host" {
  value = module.db.host
}

output "passwords" {
  sensitive = true
  value     = module.db.passwords
}

output "database" {
  value = module.db.database
}

output "user" {
  value = module.db.user
}

output "cluster_vpc" {
  value = module.db.private_network_uuid
}
