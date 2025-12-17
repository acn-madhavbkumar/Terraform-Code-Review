# Root module to call other modules

module "networking" {
  source       = "./modules/networking"
  vpc_cidr     = var.vpc_cidr
  subnet_count = var.subnet_count
}

module "load_balancing" {
  source     = "./modules/load_balancing"
  lb_name    = var.lb_name
  subnet_ids = module.networking.subnet_ids
}

module "compute" {
  source        = "./modules/compute"
  instance_type = var.instance_type
  ami_id        = var.ami_id
  subnet_id     = module.networking.subnet_ids[0]
}

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
