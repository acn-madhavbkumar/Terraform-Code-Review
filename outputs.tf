# Root module outputs

output "vpc_id" {
  description = "VPC ID from networking module"
  value       = module.networking.vpc_id
}

output "load_balancer_dns" {
  description = "DNS name of the load balancer"
  value       = module.load_balancing.lb_dns_name
}

output "instance_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = module.compute.instance_public_ip
}
