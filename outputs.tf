# Outputs ------------------------------------------------------------------------------------------
output "aws_region" {
  description = "AWS region."
  value       = var.aws_region
}

output "aws_account_id" {
  description = "AWS Account ID for the entity deploying the infrastructure."
  value = data.aws_caller_identity.current.account_id
}

output "aws_ec2_vm_hostname_prefix" {
  description = "AWS EC2 VM hostname prefix."
  value       = var.aws_ec2_vm_hostname_prefix
}

output "aws_ec2_domain" {
  description = "AWS EC2 domain name."
  value       = var.aws_ec2_domain
}

output "aws_ec2_user_name" {
  description = "AWS EC2 user name."
  value       = var.aws_ec2_user_name
}

output "aws_ec2_instance_type" {
  description = "AWS EC2 instance type."
  value       = var.aws_ec2_instance_type
}

output "aws_ec2_access_role_arn" {
  description = "AWS access role ARN for the EC2 instance profile."
  value       = aws_iam_role.ec2_access_role.arn
}

output "public_ips" {
  description = "List of public IP addresses assigned to the instances."
  value       = module.vm.public_ip
}

output "public_dns" {
  description = "List of public DNS names assigned to the instances."
  value       = module.vm.public_dns
}

output "aws_vpc_id" {
  description = "The ID of the FSO Lab VPC."
  value       = module.vpc.vpc_id
}

output "aws_vpc_azs" {
  description = "A list of availability zones specified as arguments to this VPC module."
  value       = module.vpc.azs
}

output "aws_vpc_public_subnet_ids" {
  description = "A list of IDs of public subnets."
  value       = tolist(module.vpc.public_subnets)
}

output "aws_ec2_transit_gateway_id" {
  description = "AWS Transit Gateway for the Cisco SRE network."
  value       = data.aws_ec2_transit_gateway.tgw.id
}

output "aws_eks_desired_node_count" {
  description = "Desired number of EKS worker nodes."
  value       = var.aws_eks_desired_node_count
}

output "aws_eks_min_node_count" {
  description = "Minimum number of EKS worker nodes."
  value       = var.aws_eks_min_node_count
}

output "aws_eks_max_node_count" {
  description = "Maximum number of EKS worker nodes."
  value       = var.aws_eks_max_node_count
}

output "aws_eks_instance_type" {
  description = "AWS EKS Node Group instance type."
  value       = var.aws_eks_instance_type
}

output "aws_eks_kubernetes_version" {
  description = "Kubernetes version to use for the EKS cluster."
  value       = var.aws_eks_kubernetes_version
}

output "aws_eks_cluster_name" {
  description = "Dynamically-generated AWS EKS Cluster name."
  value       = local.cluster_name
}

output "aws_eks_cluster_endpoint" {
  description = "Endpoint for EKS control plane."
  value       = module.eks.cluster_endpoint
}

output "aws_eks_cluster_primary_security_group_id" {
  description = "The cluster primary security group ID. Referred to as 'Cluster security group' in the EKS console."
  value       = module.eks.cluster_primary_security_group_id
}

output "aws_eks_cluster_security_group_id" {
  description = "Security group ID attached to the EKS cluster. Referred to as 'Additional security groups' in the EKS console."
  value       = module.eks.cluster_security_group_id
}

output "aws_eks_remote_security_group_id" {
  description = "Security group ID attached to the EKS cluster to allow SSH access."
  value       = data.aws_security_group.eks_remote.id
}

output "aws_eks_worker_security_group_id" {
  description = "Security group ID attached to the EKS workers."
  value       = module.eks.worker_security_group_id
}

output "aws_eks_kubectl_config" {
  description = "kubectl config as generated by the module."
  value       = module.eks.kubeconfig
}

output "aws_eks_config_map_aws_auth" {
  description = "A kubernetes configuration to authenticate to this EKS cluster."
  value       = module.eks.config_map_aws_auth
}

output "aws_eks_node_group_id" {
  description = "Outputs the EKS node group ID."
  value       = module.eks.node_groups.node-group.id
}

output "lab_ssh_pub_key_name" {
  description = "Name of SSH public key for EKS worker nodes."
  value       = var.lab_ssh_pub_key_name
}

output "resource_tags" {
  description = "Tag names for AWS resources."
  value       = local.resource_tags
}

output "resource_environment_home_tag" {
  description = "Resource environment home tag."
  value       = var.resource_environment_home_tag
}

output "resource_owner_tag" {
  description = "Resource owner tag."
  value       = var.resource_owner_tag
}

output "resource_project_tag" {
  description = "Resource project tag."
  value       = var.resource_project_tag
}

output "resource_event_tag" {
  description = "Resource event tag."
  value       = var.resource_event_tag
}

output "vm_sg" {
  description = "Security group attached to VM."
  value       = module.security_group.security_group_id
}

output "vm_instance_profile" {
  description = "instance profile attached to VM ."
  value       = aws_iam_instance_profile.ec2_instance_profile.id
}

output "random_suffix" {
  description = "random Suffix generated."
  value       = lower(random_string.suffix.result)
}

output "lab_prefix" {
  description = "random Suffix generated."
  value       = local.lab_resource_prefix
}

output "lab_number" {
  description = "random Suffix generated."
  value       = var.lab_number
}