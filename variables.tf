variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"  # Cheaper region, adjust as needed
}

variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
  default     = "cheap-eks"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "private_subnets" {
  description = "Private subnet CIDRs"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "public_subnets" {
  description = "Public subnet CIDRs"
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24"]
}
