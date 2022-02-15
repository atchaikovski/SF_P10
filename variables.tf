
variable "region" {
  description = "AWS Region to deploy Server in"
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "Instance Type"
  type        = string
  default     = "t2.small"
}

variable "enable_detailed_monitoring" {
  type    = bool
  default = false
}

variable "common_tags" {
  description = "Common Tags to apply to all resources"
  type        = map
  default = {
    Owner       = "Alex Tchaikovski"
    Project     = "Skill factory B10.9.2 homework"
    Purpose     = ""
  }
}

variable "domain_tchaikovski_link" {
  default = "tchaikovski.link"
}

variable "nginx_host_name" {
  type = string
  default = "www"
}


variable "az" {
  type = string
  default = "us-east-1a"
}

variable "public_key" {}

variable "private_key" {}

variable nginx_count {
  type = number
}