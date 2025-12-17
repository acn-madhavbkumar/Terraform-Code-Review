# Root module to call other modules

module "networking" {
  source      = "./modules/networking"
  vpc_cidr    = "10.0.0.0/16"
  subnet_count = 2
}

module "load_balancing" {
  source      = "./modules/load_balancing"
  lb_name     = "holiday-shopping-app-lb"
  subnet_ids  = module.networking.subnet_ids
}

module "compute" {
  source        = "./modules/compute"
  instance_type = "t2.micro"
  ami_id        = "ami-0c55b159cbfafe1f0" # Replace with a valid AMI ID
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
