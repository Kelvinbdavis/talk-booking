resource "aws_cloudwatch_metric_alarm" "billing_alarm" {
  alarm_name          = "billing-alarm"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "1"
  metric_name         = "EstimatedCharges"
  namespace           = "AWS/Billing"
  period              = "21600" # 6 hours
  statistic           = "Maximum"
  threshold           = "50" # $50 USD
  alarm_description   = "Billing alarm when charges exceed $50"
  alarm_actions       = [aws_sns_topic.billing_alert.arn]

  dimensions = {
    Currency = "USD"
  }
}

resource "aws_sns_topic_subscription" "billing_alarm_email" {
  topic_arn = aws_sns_topic.billing_alert.arn
  protocol  = "email"
  endpoint  = "archidit7@gmail.com"
}

resource "aws_sns_topic" "billing_alert" {
  name = "billing-alert"
}