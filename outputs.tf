output "cluster_endpoint" {
  description = "EKS cluster endpoint"
  value       = aws_eks_cluster.this.endpoint
}

output "cluster_name" {
  description = "EKS cluster name"
  value       = var.cluster_name
}

output "kubeconfig_command" {
  description = "Command to update kubeconfig"
  value       = "aws eks --region ${var.region} update-kubeconfig --name ${var.cluster_name}"
}
