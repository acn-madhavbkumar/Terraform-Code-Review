# Variables for Load Balancing module

variable "lb_name" {
  description = "Name of the load balancer"
  type        = string
  default     = "holiday-shopping-app-lb"
}

variable "subnet_ids" {
  description = "List of subnet IDs for the load balancer"
  type        = list(string)
}
