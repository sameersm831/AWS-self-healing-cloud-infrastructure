resource "aws_sns_topic_subscription" "email_alerts" {
  topic_arn = aws_sns_topic.self_healing_alerts.arn
  protocol  = "email"
  endpoint  = "sameermm5119@gmail.com"
}