output "cloudwatch_log_group_name" {
  description = "Name of cloudwatch log group created"
  value       = module.eks.cloudwatch_log_group_name
}

output "cluster_endpoint" {
  description = "Endpoint for EKS control plane."
  value       = module.eks.cluster_endpoint
}

output "cluster_id" {
  description = "The name/id of the EKS cluster."
  value       = module.eks.cluster_id
}

output "cluster_version" {
  description = "The Kubernetes server version for the EKS cluster."
  value       = module.eks.cluster_version
}

output "cluster_security_group_id" {
  description = "Security group ids attached to the cluster control plane."
  value       = module.eks.cluster_security_group_id
}

output "kubectl_config" {
  description = "kubectl config as generated by the module."
  value       = module.eks.kubeconfig
}

output "config_map_aws_auth" {
  description = "A kubernetes configuration to authenticate to this EKS cluster."
  value       = module.eks.config_map_aws_auth
}

output "workers_asg_arns" {
  description = "IDs of the autoscaling groups containing workers."
  value       = module.eks.workers_asg_arns
}

output "workers_asg_names" {
  description = "Names of the autoscaling groups containing workers."
  value       = module.eks.workers_asg_names
}

output "worker_security_group_id" {
  description = "Security group ID attached to the EKS workers."
  value       = module.eks.worker_security_group_id
}

output "workers_launch_template_ids" {
  description = "IDs of the worker launch templates."
  value       = module.eks.workers_launch_template_ids
}

output "workers_user_data" {
  description = "User data of worker groups"
  value       = module.eks.workers_user_data
}

output "worker_additional_policies" {
  description = "Additional policies added to the worker iam role"
  value = concat(
    var.enable_external_dns ? aws_iam_policy.external-dns-policy.*.arn : [],
    var.enable_dynamic_pv ? aws_iam_policy.dynamic-persistent-volume-provisioning.*.arn : []
  )
}

output "worker_iam_role_name" {
  description = "default IAM role name for EKS worker groups"
  value       = module.eks.worker_iam_role_name
}

output "worker_iam_role_arn" {
  description = "default IAM role ARN for EKS worker groups"
  value       = module.eks.worker_iam_role_arn
}

output "node_groups" {
  description = "Outputs from EKS node groups. Map of maps, keyed by var.node_groups keys"
  value       = module.eks.node_groups
}

output "external_dns_role_arn" {
  description = "external role arn"
  value       = var.enable_external_dns ? aws_iam_role.external-dns-role[0].arn : ""
}

output "dynamic_persistent_volume_provisioning_arn" {
  description = "Dynamic PV policy arn"
  value       = var.enable_dynamic_pv ? aws_iam_policy.dynamic-persistent-volume-provisioning[0].arn : ""
}

output "alb_role_arn" {
  description = "alb role arn"
  value       = var.enable_alb ? aws_iam_role.alb-role[0].arn : ""
}

output "kamus_role_arn" {
  description = "kamus role arn"
  value       = var.enable_kamus ? aws_iam_role.kamus-role[0].arn : ""
}