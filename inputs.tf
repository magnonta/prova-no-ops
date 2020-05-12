
variable "cluster_name" {
  default = "eks-cluster"
}

variable "eks_node_group_name" {
  default = "eks-node"
}

variable "local_file_name" {
  default = "key-private.pem"
}

variable "aws-region" {
  default     = "us-east-1"
  description = "The AWS Region to deploy EKS"
}

variable "availability-zones" {
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
  description = "The AWS AZ to deploy EKS"
}

variable "cidr" {
  default     = "10.0.0.0/16"
  description = "The VPC Subnet CIDR"
}

variable "private_subnets" {
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  description = "Private Subnet CIDR"
}

variable "public_subnets" {
  default     = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
  description = "Public Subnet CIDR"
}

variable "node-instance-type" {
  default     = "t3.micro"
  description = "Worker Node EC2 instance type"
}

variable "desired-capacity" {
  default     = 2
  description = "Autoscaling Desired node capacity"
}

variable "max-size" {
  default     = 5
  description = "Autoscaling maximum node capacity"
}

variable "min-size" {
  default     = 1
  description = "Autoscaling Minimum node capacity"
}

variable "secret_key" {
  default = "SECRET_KEY_AWS"
}

variable "access_key" {
  default = "ACCESS_KEY_AWS"
}
