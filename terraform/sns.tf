resource "aws_sns_topic" "self_healing_alerts" {
  name = "self-healing-infrastructure-alerts"

  tags = {
    Project     = var.project_name
    Environment = "Dev"
    ManagedBy   = "Terraform"
    Owner       = "Sameer"
  }
}