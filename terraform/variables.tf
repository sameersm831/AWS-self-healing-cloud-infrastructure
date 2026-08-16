variable "aws_region" {
  description = "AWS region where the infrastructure will be deployed"
  type        = string
  default     = "ap-south-1"
}

variable "project_name" {
  description = "Name used for AWS resources"
  type        = string
  default     = "CloudRescue"
}