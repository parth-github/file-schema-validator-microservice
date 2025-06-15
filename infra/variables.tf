# Variable definitions
variable "project_name" {
  description = "Name for ECS project"
  type        = string
  default     = "file-validator"
}

variable "aws_region" {
  description = "AWS region to deploy"
  type        = string
  default     = "us-east-1"
}

# variable "image_url" {
#   description = "ECR image URL"
#   type        = string
#   default     = "177099687008.dkr.ecr.us-east-1.amazonaws.com/fastapi-fargate:latest"
# }

# variable "vpc_id" {
#   description = "VPC ID where ECS will run"
#   type        = string
# }

# variable "private_subnets" {
#   description = "Subnets for ECS networking"
#   type        = list(string)
# }
