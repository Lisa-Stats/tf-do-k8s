variable "name" {
  description = "The name of the VPC"
  type        = string
}

variable "region" {
  description = "The region where the VPC will be deployed"
  type        = string
}

variable "ip_range" {
  description = "The ip range of the VPC"
  type        = string
}
