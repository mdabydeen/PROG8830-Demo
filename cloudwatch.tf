resource "aws_cloudwatch_dashboard" "prog8830-dashboard" {
  dashboard_name = "demo-dashboard-${aws_instance.webserver1.id}"
  dashboard_body = jsonencode({
    widgets = [
        {
            type = "metric"
            x   = 0 
            y = 0 
            width = 12 
            height = 6 

            properties = {
                metrics = [
                    "AWS/EC2", 
                    "CPUUtilization", 
                    "InstanceId",
                    "${aws_instance.webserver1.id}"
                ]
                period = 300 
                stat   = "Average"
                region = "us-east-1"
                title =  "${aws_instance.webserver1.id} - CPU Utilization"
            }
        }
    ]
  })
}

resource "aws_cloudwatch_metric_alarm" "ec2-cpu-alarm" {
    alarm_name = "prog8830-ec2-cpu-alarm"
    comparison_operator = "GreaterThanOrEqualToThreshold"
    evaluation_periods = 2 
    metric_name = "CPUUtilization"
    namespace = "AWS/EC2"
    period = 120
    statistic = "Average"
    threshold = 80
    alarm_description = "This metric monitors ec2 CPU utilization reaches 80%"
    insufficient_data_actions = []
}