resource "aws_cloudwatch_metric_alarm" "high_cpu" {
  alarm_name          = "CloudRescue-HighCPU-SelfHealing"
  alarm_description   = "Monitors CPU utilization of the CloudRescue-EC2 instance and triggers notification and EC2 reboot when CPU exceeds 80%."
  comparison_operator = "GreaterThanThreshold"

  evaluation_periods  = 2
  datapoints_to_alarm = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 60
  statistic           = "Average"
  threshold           = 80

  treat_missing_data = "missing"

  dimensions = {
    InstanceId = aws_instance.cloudrescue.id
  }

  alarm_actions = [
    aws_sns_topic.self_healing_alerts.arn,
    "arn:aws:swf:ap-south-1:641892071010:action/actions/AWS_EC2.InstanceId.Reboot/1.0"
  ]

  tags = {
    Project     = var.project_name
    Environment = "Dev"
    ManagedBy   = "Terraform"
    Owner       = "Sameer"
  }
}