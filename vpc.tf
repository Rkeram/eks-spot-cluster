module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.0"

  name = "${var.cluster_name}-vpc"
  cidr = var.vpc_cidr

  azs             = ["${var.region}a", "${var.region}b"]
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  enable_nat_gateway = false  # No NAT, nodes use public IPs
  single_nat_gateway = false  # Not needed

  # Auto-assign public IPs to instances in public subnets
  map_public_ip_on_launch = true

  tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
  }

  public_subnet_tags = {
    "kubernetes.io/role/elb" = "1"  # Required for EKS load balancers
  }

  private_subnet_tags = {
    "kubernetes.io/role/internal-elb" = "1"  # Optional, kept for flexibility
  }
}
