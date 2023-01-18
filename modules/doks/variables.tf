variable "cluster_name" {
  description = "A name for the Kubernetes cluster."
  type        = string
  default     = "dev-cluster"
}

variable "region" {
  type        = string
  description = "The region where the Kubernetes cluster will be created."
}

variable "vpc_uuid" {
  type        = string
  description = "The ID of the VPC where the Kubernetes cluster will be located."
  default     = null
}

variable "tags" {
  description = "A list of tag names to be applied to the Kubernetes cluster."
  type        = list(any)
  default     = ["kubernetes"]
}

variable "maintenance_policy_start_time" {
  type        = string
  description = "The start time in UTC of the maintenance window policy in 24-hour clock format / HH:MM notation"
  default     = "01:00"
}

variable "maintenance_policy_day" {
  type        = string
  description = "The day of the maintenance window policy"
  default     = "sunday"
}

variable "size" {
  type        = string
  description = "The slug identifier for the type of Droplet to be used as workers in the node pool."
  default     = "s-1vcpu-2gb"
}

variable "node_count" {
  type        = number
  description = "The number of Droplet instances in the node pool."
  default     = 2
}

variable "min_nodes" {
  type        = string
  description = "Autoscaling Minimum node capacity"
  default     = 1
}

variable "max_nodes" {
  type        = string
  description = "Autoscaling maximum node capacity"
  default     = 3
}

variable "auto_scale" {
  description = "Enable cluster autoscaling"
  type        = bool
  default     = false
}

variable "auto_upgrade" {
  type        = bool
  description = "Whether the cluster will be automatically upgraded"
  default     = false
}

variable "node_labels" {
  description = "List of Kubernetes labels to apply to the nodes"
  type        = map(any)
  default = {
    "service" = "kubernetes"
  }
}

variable "node_tags" {
  description = "The list of instance tags applied to all nodes."
  type        = list(any)
  default     = ["kubernetes"]
}

variable "node_pools" {
  description = "Additional node pool config"
  type = map(object({
    size        = string
    node_count  = number
    auto_scale  = bool
    min_nodes   = number
    max_nodes   = number
    node_tags   = list(string)
    node_labels = map(string)
  }))
  default = {}
}
