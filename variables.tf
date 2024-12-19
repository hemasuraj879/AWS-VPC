# VPC LEVEL VARIABLES
variable "vpc_cidr" {
  description = "Provide vpc cidr value"
}

variable "enable_dns_support" {
  description = "A boolean flag to enable/disable DNS support in the VPC"
  default = true
}

variable "enable_dns_hostnames" {
  description = "A boolean flag to enable/disable DNS hostnames in the VPC"
  default = true
}

variable "common_tags" {
  description = "Provide common tags for the resources"
  default = {}
}

variable "project_name" {
    description = "Provide project name"
  default = ""
}

variable "env" {
    description = "Provide env"
  default = ""
}

# public subnet
variable "public_cidr" {
    description = "Provide cidr range for public subnets"
  
}

variable "availability_zone" {
    description = "AZ for the subnet."
  default = []
}

variable "map_public_ip_on_launch" {
    description = "Specify true to indicate that instances launched into the subnet should be assigned a public IP address"
  default = false
}

# private subnet
variable "private_cidr" {
  description = "Provide cidr range for private subnets"
}

variable "peering_reqq" {
    description = "If peering required"
  default = false
}

#VPC FLOW LOGS

variable "is_flow_log_req" {
  type = bool
  description = "Please set to true if flow logs required"
  default = false
}

variable "skip_destroy" {
  type = bool
  description = "Set to true if you do not wish the log group and to be deleted at destroy time, and instead just remove the log group from the Terraform state."
  default = false
}

variable "retention_in_days" {
  type = number
  description = " Specifies the number of days you want to retain log events in the specified log group"
  default = ""
}

variable "traffic_type" {
  type = string
  description = "The type of traffic to capture"
}

variable "vpc_id" {
  type = string
  description = "VPC ID to attach to"
}

